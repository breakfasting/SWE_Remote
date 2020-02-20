class Board
  def self.print_grid(grid)
		grid.each do |row|
			puts row.join(' ')
    end
  end
  
  attr_reader :size
	
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
	end

	def [](arr)
		@grid[arr[0]][arr[1]]
	end

	def []=(arr, val)
		@grid[arr[0]][arr[1]] = val
	end

	def num_ships
		@grid.flatten.count { |ele| ele == :S }
	end

	def attack(pos)
		if self[pos] == :S
			self[pos] = :H
			p 'you sunk my battleship!'
			true
		else
			self[pos] = :X
			false
		end
	end

	def place_random_ships
    amt_ships = @size / 4
    n = @grid.length

    while amt_ships > 0
      row_i = rand(n - 1)
      col_i = rand(n - 1)
      if self[[row_i, col_i]] != :S
        self[[row_i, col_i]] = :S
        amt_ships -= 1
      end
    end
  end
  
  def hidden_ships_grid
    @grid.map do |row|
      row.map { |ele| ele == :S ? :N : ele}
    end
  end

	def cheat
		Board.print_grid(@grid)
	end

	def print
		Board.print_grid(hidden_ships_grid)
	end

end
