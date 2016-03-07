require 'oystercard'

describe Oystercard do
  it { is_expected.to respond_to(:balance) }
  it "should have a default balance of 0" do
    expect(subject.balance).to eq 0
  end
end
