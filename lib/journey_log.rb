require_relative 'journey'

class JourneyLog
  attr_reader :journey

  def initialize(journey_class)
    @journey_class = journey_class
    @journey = journey_class.new
    @journeys = []
  end

  def start_journey(station)
    journey.start(station)
  end

  def finish_journey(station)
    journey.finish(station)
    log
  end

  def journeys
    @journeys.dup
  end

  private

    def current_journey
      return @journey unless journey.complete?
      new_journey
    end

    def new_journey
      @journey ||= @journey_class.new
    end

    def log
      @journeys << @journey
    end
end
