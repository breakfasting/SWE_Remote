require_relative "room"

class Hotel
  # Part 2
  def initialize(name, hash)
    @name = name
    @rooms = {}
    hash.each do |k, v|
      @rooms[k] = Room.new(hash[k])
    end
  end

  def name
    @name.split(" ").map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(person, room_name)
    if !room_exists?(room_name)
        p 'sorry, room does not exist'
    else
        if @rooms[room_name].add_occupant(person)
            p 'check in successful'
        else
            p 'sorry, room is full'
        end
    end
  end

  def has_vacancy?
    @rooms.each do |k, v|
        if !v.full?
            return true
        end
    end
    false
  end

  def list_rooms
    # /Basement.*4\nAttic.*2\nUnder the Stairs.*0\n/
    @rooms.each do |k, v|
        puts k + " " + v.available_space.to_s
    end
  end

end
