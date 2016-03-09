require_relative "journey"

class JourneyLog

  attr_reader :current_journey

  def initialize(journey_class)
    @journey_class = journey_class
    @current_journey = journey_class.new
    @history = []
  end

  def start(station)
    @current_journey.start(station)
  end

  def complete(station)
    @current_journey.complete(station)
    log
  end

  def history
    @history.dup
  end

  def reset
    @current_journey = @journey_class.new
  end

  def no_touch_out
    @current_journey.no_touch_out
    log
    reset
  end

  private

    def log
      @history << @current_journey
    end

end
