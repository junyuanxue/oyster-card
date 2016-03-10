require 'journey_log'

describe JourneyLog do
  let(:journey_class) {double :journey_class, new: journey}
  let(:journey) { double :journey}
  let(:station) { double :station}

  subject(:journey_log) {described_class.new(journey_class)}

  describe '#start' do
    it 'starts a journey' do
      expect(journey).to receive(:start)
      journey_log.start_journey(station)
    end
  end

  describe '#finish' do
    it 'finishes a journey' do
      expect(journey).to receive(:finish)
      journey_log.finish_journey(station)
    end
  end

  describe '#journeys' do

  end
end
