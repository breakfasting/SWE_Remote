require_relative 'board'
require_relative 'human_player'

class Game
    def initialize(size, *marks)
        # @player_1 = HumanPlayer.new(mark_1)
        # @player_2 = HumanPlayer.new(mark_2)
        @players = marks.map { |mark| HumanPlayer.new(mark) }
        @game_board = Board.new(size)
        @curr_player = @players[0]
    end

    def switch_turn
        # @curr_player == @player_1 ? @curr_player = @player_2 : @curr_player = @player_1
        
        curr_i = @players.index(@curr_player)
        @curr_player = @players[(curr_i + 1) % @players.length]

        # rotate!
        @curr_player = @players.rotate![0]
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