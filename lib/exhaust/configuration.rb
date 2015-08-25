require 'yaml'

module Exhaust
  class Configuration
    class FileNotFound < StandardError; end

    attr_reader :configuration
    def initialize
      assert_file(".exhaust.yml") do |file_name|
        @configuration = YAML.load_file(file_name)
      end
    end

    def assert_file(file_name)
      raise FileNotFound.new("#{file_name} was not found") unless File.exists?(file_name)
      yield(file_name)
    end

    def ember_port
      configuration["ember"]["port"]
    end

    def ember_path
      configuration["ember"]["path"]
    end

    def rails_port
      configuration["rails"]["port"]
    end

    def rails_path
      configuration["rails"]["path"]
    end

  end
end
