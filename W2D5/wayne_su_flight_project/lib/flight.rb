class Flight

  attr_reader :passengers

  def initialize(flight_number, capacity)
    @flight_number = flight_number
    @capacity = capacity
    @passengers = []
  end

  def full?
    @passengers.length == @capacity
  end

  def board_passenger(passenger)
    if !full?
        if passenger.has_flight?(@flight_number)
            @passengers << passenger
        end
    end
  end

  def list_passengers
    @passengers.map { |passenger| passenger.name }
  end

  def [](idx)
    @passengers[idx]
  end
  
  def <<(psngr)
    board_passenger(psngr)
  end
  
end