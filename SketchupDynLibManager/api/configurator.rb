# encoding: UTF-8
require 'sketchup'
require_relative '../constants'

module SketchupDynLibManager
  module API
    class Configurator

      # Lance le mode configuration sur l’entité active
      def self.open_for_selection
        sel = Sketchup.active_model.selection
        if sel.empty?
          UI.messagebox('Veuillez sélectionner un composant à configurer.')
          return
        end
        instance = sel.first
        unless instance.is_a?(Sketchup::ComponentInstance)
          UI.messagebox('Sélection non valide.')
          return
        end
        new(instance).show_dialog
      end

      def initialize(component_instance)
        @instance = component_instance
      end

      def show_dialog
        # TODO : afficher la fenêtre HTML avec les attributs dynamiques
        UI.messagebox("Configuration de #{@instance.definition.name} (à implémenter)")
      end

      # Appliquer un hash de paramètres { 'largeur' => 100, ... }
      def apply_settings(params)
        params.each do |key, value|
          @instance.set_attribute('dynamic_attributes', key, value)
        end
      end

    end
  end
end