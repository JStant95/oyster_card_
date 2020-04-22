require './lib/station.rb'
require './lib/journey.rb'

class Oystercard
    MAXIMUM_BALANCE = 90

    attr_reader :balance, :current_journey

    def initialize
        @balance = 0
        @current_journey = Journey.new
    end

    def top_up(ammount)
        fail "Maximum of #{MAXIMUM_BALANCE} balance exceeded" if balance + ammount > MAXIMUM_BALANCE
        @balance += ammount
    end

    def touch_in (station)
        fail "Balance too low" if balance < @current_journey.fare
        @current_journey.add_entry(station)
        deduct(@current_journey.fare) if @current_journey.fare == 6
    end

    def touch_out(station)
        @current_journey.add_exit(station)
        deduct(@current_journey.fare)
    end

    private
    def deduct(ammount)
        @balance -= ammount
    end
end
