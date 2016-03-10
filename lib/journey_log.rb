require_relative 'journey'

class JourneyLog
  attr_reader :journey

  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
  end

  def start_journey(station)
    @journey = @journey_class.new
    journey.start(station)
  end

  def finish_journey(station)
    new_journey if journey.nil? || (!journey.entry_station.nil? && !journey.exit_station.nil?)
    journey.finish(station)
    # current_journey
    log
  end

  def journeys
    @journeys.dup
  end

  private

    # def current_journey
    #   return @journey unless journey.complete?
    # end

    def new_journey
      @journey = @journey_class.new
    end

    def log
      @journeys << @journey
    end
end
