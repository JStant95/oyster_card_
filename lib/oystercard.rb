require './lib/station.rb'
require './lib/journey.rb'
require './lib/journey_log.rb'

class Oystercard
    MAXIMUM_BALANCE = 90

    attr_reader :balance, :journey_log

    def initialize
        @current_journey = Journey.new
        @journey_log = JourneyLog.new(@current_journey)
        @balance = 0
    end

    def top_up(ammount)
        fail "Maximum of #{MAXIMUM_BALANCE} balance exceeded" if balance + ammount > MAXIMUM_BALANCE
        @balance += ammount
    end

    def touch_in(station)
        fail "Balance too low" if balance < @current_journey.fare
        @journey_log.start(station)
        deduct(@current_journey.fare) if @current_journey.fare == 6
    end

    def touch_out(station)
        @journey_log.finish(station)
        deduct(@current_journey.fare)
    end

    private
    def deduct(ammount)
        @balance -= ammount
    end
end
