class Passenger

  attr_reader :name

  def initialize(name)
    @name = name
    @flight_numbers = []
  end

  def has_flight?(flight_no)
    @flight_numbers.any? { |ele| ele == flight_no.upcase } #aa128
  end

  def add_flight(flight_no)
    if !has_flight?(flight_no)
      @flight_numbers << flight_no.upcase
    end
  end
end