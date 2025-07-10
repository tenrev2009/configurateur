# encoding: UTF-8
require 'logger'
require_relative '../constants'

module SketchupDynLibManager
  module Utils
    class Logger
      def self.instance
        @logger ||= begin
          Utils::FileUtilsWrapper.ensure_directory(Constants::LOGS_PATH)
          logfile = File.join(Constants::LOGS_PATH, 'plugin.log')
          ::Logger.new(logfile, 'daily')
        end
      end
    end
  end
end