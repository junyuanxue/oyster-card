class Oystercard

  attr_reader :balance
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize(balance=0)
    @balance = balance
  end

  def top_up(amount)
    fail "Your balance cannot exceed #{MAXIMUM_BALANCE}." if @balance + amount > MAXIMUM_BALANCE
  	@balance += amount
  end

  def deduct(amount)
  	@balance -= amount
  end

  def touch_in
  	fail "You do not have enough money on your card. Please top up." if @balance < MINIMUM_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

end
