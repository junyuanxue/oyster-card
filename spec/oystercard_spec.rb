require 'oystercard'

describe Oystercard do
  it { is_expected.to respond_to(:balance) }

  it { is_expected.to respond_to(:top_up) }

  it "should have a default balance of 0" do
    expect(subject.balance).to eq 0
  end

  it "should increase the balance by £10" do
  	expect{subject.top_up(10)}.to change {subject.balance}.by(10)
  end
end
