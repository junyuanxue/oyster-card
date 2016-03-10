class Journey
  MIN_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize
    @entry_station
    @exit_station
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def complete?
    !(exit_station.nil? || entry_station.nil?)
  end

  def fare
    complete? ? calculate_fare : PENALTY_FARE
  end

  private
  
    def calculate_fare
      (entry_station.zone - exit_station.zone).abs + MIN_FARE
    end
end
