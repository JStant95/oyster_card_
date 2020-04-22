require 'journey'

describe Journey do
  it "Should be able to track journey history" do
    journey = {"entry_station" => "Camden", "exit_station" => "Waterloo"}
    subject.add_journey(journey)
    expect(subject.journeys.count).to eq(1)
  end
end
