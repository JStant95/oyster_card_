require 'station'

describe Station do
  it "has a name" do
    expect(subject.name).to eq "Unnamed Station"
  end

  it "has a zone" do
    expect(subject.zone).to eq "Undefined"
  end
end
