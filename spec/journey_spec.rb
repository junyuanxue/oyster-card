require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:station) { double :station }
  let(:other_station) { double :station }

  describe '#start' do
    it 'stores the entry station' do
      journey.start(station)
      expect(journey.entry_station).to eq station
    end
  end

  describe '#finish' do
    it 'stores the exit station' do
      journey.finish(other_station)
      expect(journey.exit_station).to eq other_station
    end
  end

  describe '#complete?' do
    it 'confirms if journey is complete' do
      journey.start(station)
      journey.finish(other_station)
      expect(journey).to be_complete
    end

    context 'incomplete journeys' do
      it 'journey not finished' do
        journey.start(station)
        expect(journey).not_to be_complete
      end

      it 'journey not started' do
        journey.finish(other_station)
        expect(journey).not_to be_complete
      end
    end
  end

  describe '#fare' do

    context 'penalty fare' do
      it 'returns penatly fare for incomplete journeys' do
        expect(journey.fare).to eq Journey::PENALTY_FARE
      end
    end

    context 'calculates fare' do
      def update_zones(entry_zone, exit_zone)
        allow(station).to receive(:zone).and_return(entry_zone)
        allow(other_station).to receive(:zone).and_return(exit_zone)
      end

      before do
        journey.start(station)
        journey.finish(other_station)
      end

      it 'returns minimum fare when travelling in the same zone' do
        update_zones(1, 1)
        expect(journey.fare).to eq Journey::MIN_FARE
      end

      it 'calculates fare for zone 2 to zone 4' do
        update_zones(2, 4)
        expect(journey.fare).to eq 3
      end

      it 'calculates fare for zone 6 to zone 1' do
        update_zones(6, 1)
        expect(journey.fare).to eq 6
      end
    end
  end
end
