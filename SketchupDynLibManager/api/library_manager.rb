# encoding: UTF-8
require 'sketchup'
require 'yaml'
require_relative '../constants'

module SketchupDynLibManager
  module API
    class LibraryManager

      # Ouvre la boîte de dialogue de sélection
      def self.open_dialog
        # TODO : charger et afficher config_dialog.html
        UI.messagebox('Ouverture de la bibliothèque (à implémenter)')
      end

      def initialize(path = Constants::LIBRARY_PATH)
        @library_path = path
        @components = []
      end

      # Charge tous les SKP du dossier
      def load_library
        @components.clear
        Dir.glob(File.join(@library_path, '*.skp')).each do |file|
          @components << file
        end
      end

      # Rafraîchit la liste (UI)
      def refresh
        load_library
        # TODO : mettre à jour la vue
      end

    end
  end
end