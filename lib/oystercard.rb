class Oystercard

  attr_reader :balance, :entry_station
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_FARE = 2

  def initialize(balance=0)
    @balance = balance
  end

  def top_up(amount)
    fail "Your balance cannot exceed #{MAXIMUM_BALANCE}." if @balance + amount > MAXIMUM_BALANCE
  	@balance += amount
  end

  def touch_in(station)
  	fail "You do not have enough money on your card. Please top up." if @balance < MINIMUM_BALANCE
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
    entry_station != nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end


end
