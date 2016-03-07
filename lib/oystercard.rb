class Oystercard

  attr_reader :balance
  MAXIMUM_BAL = 90

  def initialize(balance=0)
    @balance = balance
  end

  def top_up(amount)
    fail "Your balance cannot exceed #{MAXIMUM_BAL}." if @balance + amount > MAXIMUM_BAL
  	@balance += amount
  end

  def deduct(amount)
  	@balance -= amount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

end
