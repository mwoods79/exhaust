require "exhaust/version"

module Exhaust
  def self.run!
    runner.run
  end

  def self.runner
    @runner ||= Runner.new
  end

  at_exit { runner.shutdown! }

  class Runner

    attr_reader :reader, :writer
    def initialize
      @reader, @writer = IO.pipe
    end

    def run
      while running = ember_server.gets
        if running =~ /build successful/i
          break
        end
      end

      while running = rails_server.gets
        if running =~ /info/i
          break
        end
      end
    end

    def ember_server
      @ember_server ||= begin
        Dir.chdir("spec/fixtures/ember-example") do
            @ember_server = IO.popen([{"API_HOST" => "http://localhost:3001"}, "ember", "server", "--port", "4201", "--live-reload", "false", :err => [:child, :out]])
        end
      end
    end

    def rails_server
      @rails_server ||= begin
        Dir.chdir('spec/fixtures/rails_example') do
          @rails_server = IO.popen(['rails', 'server', '--port', '3001', '--environment', 'test', :err => [:child, :out]])
        end
      end
    end

    def shutdown!
      Process.kill(9, ember_server.pid, rails_server.pid)
    end
  end
end
