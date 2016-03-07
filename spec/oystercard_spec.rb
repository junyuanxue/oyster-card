require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }
  let(:station) {double :station}
  let(:station1) {double :station1}

  describe "#initialization" do
    it "should have a default balance of 0" do
      expect(subject.balance).to eq 0
    end

    it "should have an empty history" do
      expect(subject.history).to eq ({})
    end
  end

  describe "#top_up" do
    it "should increase the balance by £10" do
    	expect{subject.top_up(10)}.to change {subject.balance}.by(10)
    end

    it "should raise error when above maximum balance" do
      amount = described_class::MAXIMUM_BALANCE + 1
      message = "Your balance cannot exceed #{described_class::MAXIMUM_BALANCE}."
      expect{ subject.top_up(amount) }.to raise_error message
    end
  end

  describe "#touch_in" do
    it "should change travelling status" do
      subject.top_up(10)
      subject.touch_in(station)
      expect(subject).to be_in_journey
    end

    it 'should raise error when below minimum balance' do
    	message = "You do not have enough money on your card. Please top up."
    	expect{subject.touch_in(station)}.to raise_error message
    end

    it 'assigns station to entry station at touch in' do
    	subject.top_up(10)
    	subject.touch_in(station)
    	expect(subject.entry_station).to eq station
    end
  end

  describe "#touch_out" do
    before do
      subject.top_up(10)
      subject.touch_in(station)
    end

    it "should change travelling status" do
      subject.touch_out(station1)
      expect(subject).not_to be_in_journey
    end

    it "should deduct from balance when touching out" do
      expect { subject.touch_out(station1) }.to change {subject.balance}.by(-described_class::MINIMUM_FARE)
    end

    it 'should reset entry_station to nil on touch out' do
    	subject.touch_out(station1)
    	expect(subject.entry_station).to eq nil
	  end

    it "assigns station to exit station at touch out" do
    	subject.touch_out(station1)
      expect(subject.exit_station).to eq station1
    end
  end

  describe "#record_history" do
    it "should record journey history" do
      subject.top_up(10)
      subject.touch_in(station)
      subject.touch_out(station1)
      expect(subject.history[station]).to eq station1
    end
  end

end
