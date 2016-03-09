require_relative "../lib/oystercard"

oyster = Oystercard.new
oyster.top_up(30)
oyster.touch_in("Holborn")
oyster.touch_out("Covent Garden")
p oyster.balance
p oyster.journey_history

oyster.touch_in("Euston")
oyster.touch_in("March Arch")
p oyster.balance
p oyster.journey_history

oyster.touch_out("Oxford Circus")
p oyster.balance
p oyster.journey_history

oyster.touch_out("Aldgate")
p oyster.journey_history
