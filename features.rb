require './lib/station.rb'
require './lib/oystercard.rb'

card = Oystercard.new
card.top_up 10
holborn = Station.new('Holborn', 1)
aldgate = Station.new('Aldgate', 1)
card.touch_in holborn
card.touch_out aldgate
p card.journey_log.journeys
p card.balance

euston = Station.new('Euston', 1)
card.touch_out(euston)
p card.journey_log.journeys
p card.balance
