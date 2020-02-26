require_relative 'card'
# Board

# The Board is responsible for keeping track of all your Cards. You'll want a grid instance variable to contain Cards. Useful methods:

# @grid
# #populate should fill the board with a set of shuffled Card pairs
# #render should print out a representation of the Board's current state #=> in the demo they give you indices on the x/y axises
# #won? should return true if all cards have been revealed.
# #reveal should reveal a Card at guessed_pos (unless it's already face-up, in which case the method should do nothing). It should also return the value of the card it revealed (you'll see why later).



# Parallel Assignment

# In Ruby you can declare and assign multiple variables at once using commas to separate multiple variables and values. For example,

# x, y, z = 1, 2, 3 # x = 1, y = 2, z = 3
# And if there's not the same number of variables and values?

# x, y = 1, 2, 3 # x = 1, y = 2, 3 is not assigned
# a, b, c = 10, 20 # a = 10, b = 20, c = nil
# When there are multiple variables assigned to an array, Ruby expands the array so that each element becomes its own value! For example,

# x, y, z = [1, 2, 3] # x = 1, y = 2, z = 3
# a, b, c = [10, 20] # a = 10, b = 20, c = nil
# This is very helpful to use when writing [](pos) and []=(pos, value) for your Board to access row and col. Because the pos exists as an array, it's better to pass it as an array in
# a method call, relying on the method to index the array.


class Board
    def initialize(n)
        #check if grid is odd - raise error?
        @grid = Array.new(n) { Array.new(n) }
        @size = n * n
    end

    def populate
        alpha = ("A".."Z").to_a
        letter_arr = []
        i = 0
        while i < @size
            letter = alpha.sample # might be dups !
            while letter_arr.include?(letter) # fixes dups, but if we need more letters remove this
                letter = alpha.sample
            end
            letter_arr << letter
            pos1, pos2 = generate_random_pair
            self[pos1] = Card.new(letter)
            self[pos2] = Card.new(letter)
            i += 2
        end
        
    end

    def [](pos)
        row = pos[0]
        col = pos[1]
        @grid[row][col]
    end

    def []=(pos, value)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = value
    end

    def valid_places
        arr = []
        @grid.each_with_index do |row, idx_row|
            row.each_with_index do |el, idx_col|
                if el.nil?
                    arr << [idx_row, idx_col]
                end
            end
        end
        arr
    end

    def generate_random_pair
        valid_places.sample(2)
    end

    def render

        masked_board = @grid.map do |row|
            row.map {|el| el.face_up? ? el.face : " "}
        end

        puts "  #{(0...@grid.length).to_a.join(' ')}"
        masked_board.each_with_index do |row, idx_row|
            puts "#{idx_row} #{row.join(' ')}"
        end
    end

    def won?
        @grid.all? do |row| 
            row.all? {|el| el.face_up?}
        end
    end

    def reveal(pos)
        if self[pos].face_up?
            return false
        else
            self[pos].reveal
            return self[pos].face
        end
    end

    def already_guessed?(pos)
        self[pos].face_up?
    end
    

end