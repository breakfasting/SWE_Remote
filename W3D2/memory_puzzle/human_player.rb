# Refactor game to include a HumanPlayer class
# Before actually implementing the computer player, let's make things easier on ourselves and refactor the game to accept player classes. In order to accomplish this, move all of your user input logic 
# into the player class. I moved the following methods out of the Game class into the player:

# prompt
# get_input
# Before moving on, make sure your game runs successfully with a HumanPlayer.

# Create a ComputerPlayer class
# The computer player's strategy should be as follows:

# On its first guess, if it knows where 2 matching cards are, guess one of them, otherwise guess randomly among cards it has not yet seen.
# On its second guess, if its first guess revealed a card whose value matches a known location, guess that location, otherwise guess randomly among cards it has not yet seen.
# Now comes the tricky part. With the HumanPlayer, we didn't need to explicitly receive the data from the card we're flipping over; we just read it off the terminal output. The computer won't
# be quite so savvy. Let's write some methods to have it accept the revealed card information from the game:

# receive_revealed_card should take in a position and the value of the card revealed at that location. It should then store it in a @known_cards hash.
# receive_match should take in two positions which are a successful match. I stored these in an instance variable @matched_cards
# The game should then call these methods on the player in addition to displaying the revealed cards to the terminal.

# NB: The game shouldn't have to know whether a human or computer is playing. Instead, it should use duck typing. This may involve writing some "dummy" methods on the HumanPlayer class. That's ok.

class HumanPlayer
    

    def get_guess
        puts "Enter position like '0 0' "
        gets.chomp.split(" ").map(&:to_i)
    end
end