require "journeylog"

describe JourneyLog do

  let(:station) { double :station }
  let(:journey) { double :journey }
  let(:journey_class) { double :journey_class, new: journey }
  subject(:journeylog) { described_class.new(journey_class) }

  describe "#start" do
    it "should start a journey" do
      expect(journey).to receive(:start)
      subject.start(station)
    end
  end

  describe "#complete" do
    it "should complete a journey" do
      expect(journey).to receive(:complete)
      subject.complete(station)
    end
  end

end
