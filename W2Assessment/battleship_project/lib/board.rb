class Board

  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](pos_arr)
    @grid[pos_arr[0]][pos_arr[1]]
  end

  def []=(pos_arr, val)
    @grid[pos_arr[0]][pos_arr[1]] = val
  end

  def num_ships
    @grid.sum do |row|
      row.count { |ele| ele == :S }
    end
  end

  # Part 2
  def attack(pos_arr)
    if self[pos_arr] == :S
      self[pos_arr] = :H
      puts 'you sunk my battleship!'
      return true
    else
      self[pos_arr] = :X
      return false
    end
  end

  def place_random_ships
    amt_ships = @size / 4
    while amt_ships > 0
      row = rand(@grid.length - 1)
      col = rand(@grid.length - 1)
      if self[[row, col]] == :N
        self[[row, col]] = :S
        amt_ships -= 1
      end
    end
  end

  def hidden_ships_grid
    hidden_grid = @grid.map do |row|
      row.map { |ele| ele == :S ? :N : ele }
    end
  end

  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end