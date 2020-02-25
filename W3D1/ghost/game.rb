class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
    @fragment = ''
    @dictionary = {}
  end
end