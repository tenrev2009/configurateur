# encoding: UTF-8
require 'sketchup'
require_relative 'constants'

# APIs
require_relative 'api/library_manager'
require_relative 'api/component_inserter'
require_relative 'api/configurator'
require_relative 'api/optimizer'
require_relative 'api/reconfigurator'

# Models & Utils
require_relative 'models/component_profile'
require_relative 'utils/file_utils'
require_relative 'utils/logger'

module SketchupDynLibManager
  unless file_loaded?(__FILE__)
    # Création des dossiers de config/logs si nécessaire
    Utils::FileUtilsWrapper.ensure_directory(Constants::CONFIG_DIR)
    Utils::FileUtilsWrapper.ensure_directory(Constants::LIBRARY_PATH)
    Utils::FileUtilsWrapper.ensure_directory(Constants::LOGS_PATH)

    # Barre d’outils
    toolbar = UI::Toolbar.new(Constants::PLUGIN_NAME)

    # Commande : ouvrir la bibliothèque
    cmd_lib = UI::Command.new('Bibliothèque') {
      API::LibraryManager.open_dialog
    }
    cmd_lib.small_icon = File.join(Constants::ICONS_PATH, 'library.png')
    toolbar.add_item cmd_lib

    # Commande : insertion rapide
    cmd_ins = UI::Command.new('Insérer') {
      API::ComponentInserter.new.insert_interactively
    }
    cmd_ins.small_icon = File.join(Constants::ICONS_PATH, 'insert.png')
    toolbar.add_item cmd_ins

    # Commande : configuration/édition
    cmd_cfg = UI::Command.new('Configurer') {
      API::Configurator.open_for_selection
    }
    cmd_cfg.small_icon = File.join(Constants::ICONS_PATH, 'config.png')
    toolbar.add_item cmd_cfg

    toolbar.show
    file_loaded(__FILE__)
  end
end