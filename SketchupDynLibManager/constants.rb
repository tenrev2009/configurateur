# encoding: UTF-8
module SketchupDynLibManager
  module Constants
    PLUGIN_ID     = 'SketchupDynLibManager'
    PLUGIN_NAME   = 'Gestionnaire de Bibliothèque Dyn.'
    VERSION       = '0.1.0'
    AUTHOR        = 'Votre Nom'
    ROOT          = File.dirname(__FILE__)
    UI_PATH       = File.join(ROOT, 'ui')
    ICONS_PATH    = File.join(UI_PATH, 'icons')
    DIALOG_PATH   = File.join(UI_PATH, 'dialog')
    CONFIG_DIR    = File.join(Dir.home, '.sketchup_dyn_lib_manager')
    LIBRARY_PATH  = File.join(CONFIG_DIR, 'default_library')
    PROFILES_PATH = File.join(CONFIG_DIR, 'user_profiles.yml')
    LOGS_PATH     = File.join(CONFIG_DIR, 'logs')
  end
end