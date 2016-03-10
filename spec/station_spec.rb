require 'station'

describe Station do
  subject(:station) { described_class.new("Aldgate", 1) }

  describe '#name' do
    it 'starts with a name' do
      expect(station.name).to eq 'Aldgate'
    end
  end

  describe '#zone' do
    it 'starts with a zone' do
      expect(station.zone).to eq 1
    end
  end
end
