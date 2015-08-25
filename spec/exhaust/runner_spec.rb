require 'spec_helper'

describe Exhaust::Runner do

  let(:configuration) do
    double(
      ember_port: "4321",
      ember_path: "/ember/path",
      rails_port: "1234",
      rails_path: "/rails/path"
    )
  end

  subject(:runner) { described_class.new(configuration) }

  describe "#initialize" do
    it "knows embers host" do
      expect(subject.ember_host).to eq("http://localhost:4321")
    end
    it "knows embers port" do
      expect(subject.ember_port).to eq("4321")
    end

    it "knows rails port" do
      expect(subject.rails_port).to eq("1234")
    end

    it "knows the path to ember" do
      expect(runner.ember_path).to eq("/ember/path")
    end

    it "knows the path to rails" do
      expect(runner.rails_path).to eq("/rails/path")
    end
  end

end
