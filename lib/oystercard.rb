class Oystercard

  DEFAULT_BALANCE = 0
  MAX_LIMIT = 90
  MIN_LIMIT = 1

  attr_reader :balance, :journeys, :journey

  def initialize(journey: Journey)
    @balance = DEFAULT_BALANCE
    @journeys = []
    @journey = journey.new
  end

  def top_up(amount)
    raise "Exceeded £#{MAX_LIMIT} limit" if max_reached?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "You must have over £#{MIN_LIMIT} on your card" if min_reached?
    no_touch_out
    journey.start(station)
  end

  def touch_out(station)
    journey.finish(station)
    deduct
    store_journey
  end

  private

    def reset
      @journey
    end

    def no_touch_out
      deduct if journey.exit_station.nil? && !journey.entry_station.nil?
      reset
    end

    def max_reached?(amount)
      @balance + amount > MAX_LIMIT
    end

    def min_reached?
      @balance < MIN_LIMIT
    end

    def deduct
      @balance -= journey.fare
    end

    def store_journey
      @journeys << @journey
    end
end
