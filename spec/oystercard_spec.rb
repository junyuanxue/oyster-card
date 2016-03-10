require 'oystercard'

describe Oystercard do
  let(:station) { double :station }
  let(:journey_log) { double :journey_log }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  subject(:oystercard) { described_class.new }

  describe 'initialization' do
    it 'with balance of £0' do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'expect to add amount to card balance' do
      expect {oystercard.top_up(10)}.to change{oystercard.balance}.by 10
    end

    it "expects to raise error when max balance exceeded" do
      fare = Oystercard::MAX_BAL + 1
      message = Oystercard::MAX_BAL_ERROR
      expect{oystercard.top_up fare}.to raise_error message
    end
  end

  describe '#touch_in' do

    it 'raises error when minimum balance reached' do
      message = Oystercard::MIN_BAL_ERROR
      expect {oystercard.touch_in(entry_station)}.to raise_error message
    end

    it 'starts a journey' do
      oystercard.top_up(1)
      expect(oystercard.journey_log).to receive(:start_journey)
      oystercard.touch_in(entry_station)
    end
  end

  describe '#touch_out' do
    before do
      oystercard.top_up(1)
      oystercard.touch_in(entry_station)
    end

    it 'finishes a journey' do
      expect(oystercard.journey_log).to receive(:finish_journey)
      oystercard.touch_out(exit_station)
    end
  end
end
