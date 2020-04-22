require './lib/journey.rb'

class JourneyLog
  attr_reader :journeys, :current_journey

  def initialize(journey)
    @current_journey = journey
    @journeys = []
  end

  def start(station)
    @current_journey.add_entry(station)
  end

  def finish(station)
    @current_journey.add_exit(station)
  end

  private
  def reset
    @current_journey.entry = nil
    @current_journey.exit = nil
    @current_journey.fare = 1
  end

  def add_journey
    entry_station = @current_journey.entry
    exit_station = @current_journey.exit
    if entry_station && exit_station
      @journeys << {:entry_station => entry_station, :exit_station => exit_station}
      reset
    end
  end
end
