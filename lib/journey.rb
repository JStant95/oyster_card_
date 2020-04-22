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
    add_journey
  end

  def in_journey
    !!@entry
  end

  #def fare
  #end

  private
  def reset
    @entry = nil
    @exit = nil
    @fare = 1
  end

  def add_journey
    if @entry && @exit
      @journeys << {:entry_station => @entry, :exit_station => @exit}
      reset
    end
  end
end
