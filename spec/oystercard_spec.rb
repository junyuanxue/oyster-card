require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  describe "#balance" do
    it "should have a default balance of 0" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "should increase the balance by £10" do
    	expect{subject.top_up(10)}.to change {subject.balance}.by(10)
    end

    it "should raise error when balance is above maximum limit" do
      amount = described_class::MAXIMUM_BAL + 1
      message = "Your balance cannot exceed #{described_class::MAXIMUM_BAL}."
      expect{ subject.top_up(amount) }.to raise_error message
    end
  end

  describe "#reduce" do
    it "should reduce the balance by £10" do
    	o = Oystercard.new(20)
    	expect{o.deduct(10)}.to change {o.balance}.by(-10)
    end
  end

  describe "#touch_in" do
    it "should change travelling status" do
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

  describe "#touch_out" do
    it "should change travelling status" do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end
end
