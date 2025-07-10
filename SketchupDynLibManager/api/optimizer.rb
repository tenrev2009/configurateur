# encoding: UTF-8
require 'sketchup'
require_relative '../constants'

module SketchupDynLibManager
  module API
    class Optimizer

      def initialize(component_instance)
        @instance = component_instance
      end

      # Supprime tous les attributs dynamiques pour alléger
      def optimize
        dict = @instance.attribute_dictionary('dynamic_attributes', false)
        dict.clear if dict
        store_identifier
      end

      # Garde en méta la GUID de la définition d’origine
      def store_identifier
        guid = @instance.definition.guid.to_s
        @instance.set_attribute('plugin_meta', 'original_definition_guid', guid)
      end

    end
  end
end