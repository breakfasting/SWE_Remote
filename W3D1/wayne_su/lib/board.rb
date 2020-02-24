class Board

  attr_reader :max_height

  def self.build_stacks(num_stacks)
    stacks = Array.new(num_stacks) { [] }
  end

  def initialize(num_stacks, max_height)
    if num_stacks < 4 || max_height < 4
      raise "rows and cols must be >= 4"
    end
    @max_height = max_height
    @stacks = Board.build_stacks(num_stacks)
  end

  def add(token, stack_index)
    if @stacks[stack_index].length < @max_height
      @stacks[stack_index] << token
      return true
    else
      return false
    end
  end

  def vertical_winner?(token)
    @stacks.any? do |stack|
      stack.length == @max_height && stack.all? { |ele| ele == token}
    end
  end

  def horizontal_winner?(token)
    (0..@max_height - 1).each do |hor_i|
      return true if @stacks.all? do |stack|
        stack[hor_i] == token
      end
    end
    false
  end

  def winner?(token)
    vertical_winner?(token) || horizontal_winner?(token)
  end

  # This Board#print method is given for free and does not need to be modified
  # It is used to make your game playable.
  def print
    @stacks.each { |stack| p stack }
  end
end
