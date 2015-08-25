require 'spec_helper'

describe Exhaust::Configuration do

  describe "#initialize" do
    it "throws an error if yaml is not present" do
      allow(File).to receive(:exists?).and_return(false)
      expect{described_class.new}.to raise_error(Exhaust::Configuration::FileNotFound)
    end

    it "knows the ember host" do
      expect(subject.ember_port).to eq 4201
    end

    it "knows the ember path" do
      expect(subject.ember_path).to eq "./spec/fixtures/ember-example"
    end

    it "knows the rails host" do
      expect(subject.rails_port).to eq 3001
    end

    it "knows the rails path" do
      expect(subject.rails_path).to eq "./spec/fixtures/rails_example"
    end
  end

end
