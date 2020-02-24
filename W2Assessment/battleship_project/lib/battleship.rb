require_relative "board"
require_relative "player"

class Battleship

  attr_reader :board, :player

  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end
  
  def start_game
    @board.place_random_ships
    puts @board.size / 4
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts 'you lose'
      return true
    else
      return false
    end
  end

  def win?
    if @board.num_ships == 0
      puts 'you win'
      return true
    else
      return false
    end
  end

  def game_over?
    self.win? || self.lose?
  end

  def turn
    resp_arr = @player.get_move
    if @board.attack(resp_arr)
      @board.print
    else
      @remaining_misses -= 1
      @board.print
    end
    puts @remaining_misses
  end
end

# Done in 25m44s
