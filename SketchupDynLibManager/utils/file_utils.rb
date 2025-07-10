# encoding: UTF-8
require 'fileutils'
require 'yaml'
require_relative '../constants'

module SketchupDynLibManager
  module Utils
    class FileUtilsWrapper

      # Créé un dossier (et parents) s’il n’existe pas
      def self.ensure_directory(path)
        FileUtils.mkdir_p(path) unless Dir.exist?(path)
      end

      def self.read_yaml(path)
        return {} unless File.exist?(path)
        YAML.load_file(path)
      end

      def self.write_yaml(path, content)
        ensure_directory(File.dirname(path))
        File.open(path, 'w') { |f| f.write(content.to_yaml) }
      end

    end
  end
end