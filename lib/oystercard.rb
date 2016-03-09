require_relative "journey"
require_relative "station"
require_relative "journeylog"

class Oystercard

  MAXIMUM_BALANCE = 90
  MAXIMUM_BALANCE_ERROR = "Maximum balance of #{MAXIMUM_BALANCE} exceeded"
  MINIMUM_BALANCE = 1
  MINIMUM_BALANCE_ERROR = "Balance under #{MINIMUM_BALANCE}"
  attr_reader :balance

  def initialize
    @balance = 0
    @journeylog = JourneyLog.new(Journey)
  end

  def top_up(amount)
    raise MAXIMUM_BALANCE_ERROR if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise MINIMUM_BALANCE_ERROR if @balance < MINIMUM_BALANCE
    no_touch_out if @journeylog.current_journey.entry_station != nil && @journeylog.current_journey.exit_station == nil
    @journeylog.start(station)
  end

  def touch_out(station)
    @journeylog.complete(station)
    deduct(@journeylog.current_journey.fare)
    @journeylog.reset
  end

  def journey_history
    @journeylog.journey_history
  end

  private

    def deduct(amount)
      @balance -= amount
    end

    def no_touch_out
      deduct(@journeylog.current_journey.fare)
      @journeylog.no_touch_out
    end

end
