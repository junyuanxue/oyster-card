require_relative 'journey'

class JourneyLog
  attr_reader :journey

  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
  end

  def start_journey(station)
    new_journey
    journey.start(station)
  end

  def finish_journey(station)
    new_journey if journey.nil? || journey.complete?
    journey.finish(station)
    log
  end

  def journeys
    @journeys.dup
  end

  def no_touch_out
    log
    new_journey
  end

  private
    def new_journey
      @journey = @journey_class.new
    end

    def log
      @journeys << @journey
    end
end
