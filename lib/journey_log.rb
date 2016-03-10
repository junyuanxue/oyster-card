class JourneyLog
  attr_reader :journey

  def initialize(journey_class)
    @journey = journey_class.new
  end

  def start_journey(station)
    journey.start(station)
  end
end
