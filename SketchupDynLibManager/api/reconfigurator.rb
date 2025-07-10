# encoding: UTF-8
require 'sketchup'
require_relative 'configurator'

module SketchupDynLibManager
  module API
    class Reconfigurator

      def initialize(component_instance)
        @instance = component_instance
      end

      # Remplace par la version dynamique et relance la config
      def reconfigure
        meta = @instance.get_attribute('plugin_meta', 'original_definition_guid')
        unless meta
          UI.messagebox('Aucun lien vers le composant d’origine.')
          return
        end
        model = Sketchup.active_model
        orig_def = model.definitions.find { |d| d.guid.to_s == meta }
        if orig_def
          tr = @instance.transformation
          parent = @instance.parent
          parent.erase_entities(@instance)
          new_inst = parent.entities.add_instance(orig_def, tr)
          Configurator.new(new_inst).show_dialog
        else
          UI.messagebox('Définition d’origine introuvable.')
        end
      end

    end
  end
end