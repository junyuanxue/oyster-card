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
    before do
      allow(journey).to receive(:complete?).and_return(true)
    end

    it 'finishes a journey when it is complete' do
      expect(journey).to receive(:finish)
      journey_log.finish_journey(station)
    end

    it 'logs a journey' do
      allow(journey).to receive(:finish)
      journey_log.finish_journey(station)
      expect(journey_log.journeys).to include(journey)
    end
  end
end
