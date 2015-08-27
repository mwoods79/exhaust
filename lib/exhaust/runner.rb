module Exhaust
  class Runner

    attr_reader :configuration
    def initialize(configuration=Exhaust::Configuration.new)
      @configuration = configuration
    end

    def run
      Timeout::timeout(30) do
        while running = ember_server.gets
          if running =~ /build successful/i
            break
          end
        end

        while running = rails_server.gets
          puts running
          if running =~ /info/i
            break
          end
        end
      end
    end

    def ember_host
      "http://localhost:#{ember_port}"
    end

    def ember_port
      configuration.ember_port.to_s
    end

    def rails_port
      configuration.rails_port.to_s
    end

    def ember_path
      configuration.ember_path
    end

    def rails_path
      configuration.rails_path
    end

    def ember_server
      @ember_server ||= begin
        Dir.chdir(ember_path) do
          @ember_server = IO.popen([{"API_HOST" => "http://localhost:#{rails_port}"}, "ember", "server", "--port", ember_port, "--live-reload", "false", :err => [:child, :out]])
        end
      end
    end

    def rails_server
      @rails_server ||= begin
        Dir.chdir(rails_path) do
          @rails_server = IO.popen(['rails', 'server', '--port', rails_port, '--environment', 'test', :err => [:child, :out]])
        end
      end
    end

    def shutdown!
      Process.kill(9, ember_server.pid, rails_server.pid)
    end
  end
end
