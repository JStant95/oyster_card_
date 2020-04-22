require 'oystercard'
require 'station'
require 'journey'

describe Oystercard do
    subject(:oystercard) {described_class.new}
    let(:station) { double :station }
    let(:exit_station) {double :exit_station}

    it "oyster card has 0 as default value" do
        expect(oystercard.balance).to eq(0)
    end

    # it "oyster card loaded with 5 pounds" do
    #     expect(oystercard.top_up(5)).to eq(5)
    # end

    describe "#top_up" do

       #it { is_expected.to respond_to(:top_up).with(1).argument }

       it "can top up the balance" do
        expect{ subject.top_up 1 }.to change{subject.balance }.by 1
       end

       it "raises an error if the maximun balance is exeeded" do
         maximum_balance = Oystercard::MAXIMUM_BALANCE
         oystercard.top_up(maximum_balance)
         expect{ subject.top_up 1 }.to raise_error "Maximum of #{maximum_balance} balance exceeded"
       end
    end

  #   describe "#deduct" do

  #     it { is_expected.to respond_to(:deduct).with(1).argument }

  #     it "should be able to deduct from balance" do
  #       expect { subject.deduct(5) }.to change{ subject.balance }.by(-5)
  #     end
  # end

  describe "#touch_in" do

    it "Should raise error when you try to touch in with balance less than min fare" do
      expect{ subject.touch_in(station) }.to raise_error("Balance too low")
    end
  end

  describe "#touch_out" do
  before(:each) {subject.top_up(subject.current_journey.fare)}

    it "deducts money from card once touch_out" do
      subject.touch_in(station)
      expect{subject.touch_out(station)}.to change{subject.balance}.by(-subject.current_journey.fare)
  end
end

  describe "in_journey" do
    before(:each) {subject.top_up(subject.current_journey.fare)}

   it "In journey is set to true after #touch_in" do
    subject.touch_in(station)
    expect(subject.current_journey.in_journey).to eq(true)
  end
end

describe "entry_station" do
  before(:each) {subject.top_up(subject.current_journey.fare)}
  before(:each) { subject.touch_in(station) }

  it 'Should track what the entry station is after touch in' do
    expect(subject.current_journey.entry).to eq(station)
  end

  it 'After touching out entry station should return nil' do
    subject.touch_out(station)
    expect(subject.current_journey.entry).to eq(nil)
  end
end

describe "journey" do
  before(:each) {subject.top_up(subject.current_journey.fare)}

  it "A new card should have a empty list of journeys" do
    expect(subject.current_journey.journeys).to eq([])
  end

  it "A completed journey should be storedin journey" do
    subject.touch_in(station)
    subject.touch_out(exit_station)
    expect(subject.current_journey.journeys[0]).to eq({:entry_station => station, :exit_station => exit_station})
  end
end

end
