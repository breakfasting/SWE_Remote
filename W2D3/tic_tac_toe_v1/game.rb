require_relative 'board'
require_relative 'human_player'

class Game
    def initialize(mark_1, mark_2)
        @player_1 = HumanPlayer.new(mark_1)
        @player_2 = HumanPlayer.new(mark_2)
        @game_board = Board.new
        @curr_player = @player_1
    end

    def switch_turn
        @curr_player == @player_1 ? @curr_player = @player_2 : @curr_player = @player_1
    end

    def play
        while @game_board.empty_positions?
            @game_board.print
            puts "It's #{@curr_player.mark}'s turn"
            @game_board.place_mark(@curr_player.get_position, @curr_player.mark)
            if @game_board.win?(@curr_player.mark)
              puts "#{@curr_player.mark} Won!"
              return
            else
              self.switch_turn
            end
        end
        puts "Draw!"
    end

end