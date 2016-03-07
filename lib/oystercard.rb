class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :history
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 2

  def initialize(balance=0)
    @balance = balance
    @history = Hash.new
  end

  def top_up(amount)
    fail "Your balance cannot exceed #{MAXIMUM_BALANCE}." if @balance + amount > MAXIMUM_BALANCE
  	@balance += amount
  end

  def touch_in(station)
  	fail "You do not have enough money on your card. Please top up." if @balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    record_history(entry_station, station)
    @exit_station = station
    @entry_station = nil
  end

  def in_journey?
    entry_station != nil
  end

  def record_history(entry_station, exit_station)
    history[entry_station] = exit_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end


end
