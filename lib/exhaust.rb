require 'exhaust/configuration'
require 'exhaust/runner'
require 'exhaust/version'

module Exhaust
  def self.run!
    runner.run
  end

  def self.runner
    @runner ||= Runner.new
  end

  def self.ember_host
    runner.ember_host
  end

  def shutdown!
    runner.shutdown!
  end
end
