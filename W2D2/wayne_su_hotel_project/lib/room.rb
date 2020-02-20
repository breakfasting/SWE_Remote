class Room

  attr_reader :capacity, :occupants

  def initialize(capacity)
    @capacity = capacity
    @occupants = []
  end

  def full?
    if @occupants.length == @capacity
      true
    elsif @occupants.length < @capacity
      false
    end
  end

  def available_space
    @capacity - @occupants.length
  end

  def add_occupant(name)
    if self.full?
      false
    else
      @occupants << name
      true
    end
  end
end
