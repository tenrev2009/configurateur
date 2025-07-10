# encoding: UTF-8
require 'yaml'
require_relative '../constants'

module SketchupDynLibManager
  module Models
    # Représente un profil de configuration d’un composant
    class ComponentProfile
      attr_accessor :name, :parameters

      # name       : String, nom du profil
      # parameters : Hash, ex. { 'largeur' => 100, 'hauteur' => 200 }
      def initialize(name, parameters = {})
        @name       = name
        @parameters = parameters
      end

      # Pour sérialiser en YAML
      def to_h
        { 'name' => @name, 'parameters' => @parameters }
      end

      # Charge tous les profils depuis le fichier YAML
      # @return [Array<ComponentProfile>]
      def self.load_all
        path = Constants::PROFILES_FILE
        return [] unless File.exist?(path)
        data = YAML.load_file(path)
        data.map { |h| new(h['name'], h['parameters']) }
      end

      # Enregistre une liste de profils dans le YAML
      # @param profiles [Array<ComponentProfile>]
      def self.save_all(profiles)
        path = Constants::PROFILES_FILE
        dir  = File.dirname(path)
        Dir.mkdir(dir) unless Dir.exist?(dir)
        File.open(path, 'w') do |f|
          f.write(profiles.map(&:to_h).to_yaml)
        end
      end
    end
  end
end