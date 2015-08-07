require 'spec_helper'

describe Exhaust do
  it 'has a version number' do
    expect(Exhaust::VERSION).not_to be nil
  end

  it 'smoke test' do
    Exhaust.run!
  end
end
