require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  it { is_expected.to respond_to(:balance) }

  it { is_expected.to respond_to(:top_up) }

  it "should have a default balance of 0" do
    expect(subject.balance).to eq 0
  end

  it "should increase the balance by £10" do
  	expect{subject.top_up(10)}.to change {subject.balance}.by(10)
  end

  it "should raise error when balance is above maximum limit" do
    amount = described_class::MAXIMUM_BAL + 1
    message = "Your balance cannot exceed #{described_class::MAXIMUM_BAL}."
    expect{ subject.top_up(amount) }.to raise_error message
  end

  it "should reduce the balance by £10" do
  	o = Oystercard.new(20)
  	expect{o.deduct(10)}.to change {o.balance}.by(-10)
  end
end
