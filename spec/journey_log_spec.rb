require 'journey'
require 'journey_log'
require 'oystercard'

describe JourneyLog do
  before(:each) do
    @journey_log = JourneyLog.new(Journey.new)
  end

  it "returns list of journeys" do
    expect(@journey_log.journeys.class).to eq Array
  end

  it '#start should start a new journey with an entry station' do
    @journey_log.start("Camden")
    expect(@journey_log.current_journey.entry).to eq("Camden")
  end

  it '#finish should end current_journey with exit station' do
    @journey_log.finish("Waterloo")
    expect(@journey_log.current_journey.exit).to eq("Waterloo")
  end
end
