require_relative 'spec_helper'

describe Rules do
  let(:rules) {Rules.new}

  it "should created a new rules object with Rules.new" do
    expect(rules.class).to eq(Rules)
  end
end