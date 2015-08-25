Dir[Dir.pwd + "/lib/exhaust/**/*.rb"].each { |f| require f }

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
