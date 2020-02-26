require_relative "board"
require_relative "human_player"

# Game
# The Game should have instance variable for the Board and the previously-guessed position (if any).
 
#@board
#@previous_guess

#It should also have methods for managing the Board-Player interaction. You may want a play loop that runs until the game is over. Inside the loop, you should render the board, prompt 
# the player for input, and get a guessed pos. Pass this pos to a make_guess method, where you will handle the
#  actual memory/matching logic. Some tips on implementing this:

#Game#play
#call to @board.render
#get player input - pos => call this guessed_pos
#pass pos to a make_guess method

#Game#make_guess
    #if card value at the guessed_pos == previous guess
        

# If we're not already checking another Card, leave the card at guessed_pos face-up and update the previous_guess variable.
# If we are checking another card, we should compare the Card at guessed_pos with the one at previous_guess.
# If the cards match, we should leave them both face-up.
# Else, flip both cards face-down.
# In either case, reset previous_guess.
# It wouldn't be an interesting game if the player could see their previous moves. Run system("clear") before rendering the Board. This will hide any previous output from the player. sleep(n) will pause
# the program for n seconds. Use this method to (temporarily) show the player an incorrect guess before flipping the Cards face-down again.


class Game
    def initialize(player, n=4)
        @board = Board.new(n)
        @previous_guess = [] #
        @player = player
    end

    def make_guess(guess_pos)
        reveal_and_render(guess_pos)
        if @previous_guess.empty?
            @previous_guess << guess_pos
        else
            last_guess = @previous_guess.pop
            unless @board[last_guess] == @board[guess_pos]
                puts 'Incorrect, try again'
                @board[last_guess].hide
                @board[guess_pos].hide
            else
                puts 'correct'
            end
            end_of_turn
        end
    end

    # def get_guess
    #     puts "Enter position like '0 0' "
    #     gets.chomp.split(" ").map(&:to_i)
    # end

    def play
        @board.populate
        @board.render
        until @board.won?
            
            guess = @player.get_guess
            if @board.already_guessed?(guess)
                puts "already guessed"
            else
                make_guess(guess)
            end
        end
        puts "You win"
    end

    def reveal_and_render(guess_pos)
        @board.reveal(guess_pos)
        @board.render
    end

    def end_of_turn
        puts "End of turn"
        sleep(5)
        system('clear')
    end

end