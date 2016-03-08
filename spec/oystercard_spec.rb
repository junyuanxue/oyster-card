require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}

  describe '#balance'do
    it { expect(oystercard).to respond_to(:balance) }
    it { expect(oystercard).to respond_to(:top_up).with(1).argument }

    it "expect balance to be 0" do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'can top up balance' do
      expect{oystercard.top_up 5}.to change{oystercard.balance}.by 5
    end

    it 'fails if topup exceeds maximum balance' do
      expect{ oystercard.top_up(95) }.to raise_error described_class::MAX_ERROR
    end
  end
end
