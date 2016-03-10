require_relative 'journey_log'

class Oystercard
  DEFAULT_BALANCE = 0
  MAX_BAL = 90
  MIN_BAL = 1
  MAX_BAL_ERROR = "Exceeded £#{MAX_BAL} limit"
  MIN_BAL_ERROR = "You must have over £#{MIN_BAL} on your card"

  attr_reader :balance, :journey_log

  def initialize
    @balance = DEFAULT_BALANCE
    @journey_log = JourneyLog.new(Journey)
  end

  def top_up(amount)
    raise MAX_BAL_ERROR if max_reached?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise MIN_BAL_ERROR if min_reached?
    no_touch_out unless journey_log.journey.nil?
    journey_log.start_journey(station)
  end

  def touch_out(station)
    journey_log.finish_journey(station)
    deduct
  end

  private
    def no_touch_out
      if journey_log.journey.exit_station.nil? && !journey_log.journey.entry_station.nil?
        deduct
        journey_log.no_touch_out
      end
    end

    def max_reached?(amount)
      @balance + amount > MAX_BAL
    end

    def min_reached?
      @balance < MIN_BAL
    end

    def deduct
      @balance -= journey_log.journey.fare
    end
end
