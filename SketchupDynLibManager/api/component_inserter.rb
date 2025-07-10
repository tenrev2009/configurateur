# encoding: UTF-8
require 'sketchup'
require_relative '../constants'

module SketchupDynLibManager
  module API
    class ComponentInserter

      # Insertion interactive avec la souris
      def insert_interactively
        model = Sketchup.active_model
        # TODO : ouvrir un sélecteur de composant, puis :
        # definition = model.definitions.load(path)
        # model.place_component(definition)
        UI.messagebox('Insertion interactive (à implémenter)')
      end

    end
  end
end