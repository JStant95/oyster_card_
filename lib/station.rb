

class Station
  attr_reader :name, :zone

  def initialize(name = "Unnamed Station", zone = "Undefined")
    @name = name
    @zone = zone
  end
end
