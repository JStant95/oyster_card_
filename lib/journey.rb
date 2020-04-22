class Journey
  MINIMUM_FARE = 1
  attr_reader :journeys, :entry, :exit, :fare

  def initialize
    @journeys = []
    @entry = nil
    @exit = nil
    @fare = MINIMUM_FARE
  end

  def add_entry(station)
    @fare = 6 if @entry
    @entry = station
  end

  def add_exit(station)
    @fare = 6 if !@entry
    @exit = station
  end

  def in_journey
    !!@entry
  end
end
