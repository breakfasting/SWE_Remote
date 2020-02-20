class Hangman

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    matching_indices = []
    @secret_word.each_char.with_index do |c, i|
      matching_indices << i if char == c
    end
    matching_indices
  end

  def fill_indices(char, arr_i)
    arr_i.each do |i|
      @guess_word[i] = char
    end
  end

  # part 2

  def try_guess(char)
    if already_attempted?(char)
      puts 'that has already been attempted'
      false
    else
      if self.get_matching_indices(char).length == 0
        @remaining_incorrect_guesses -= 1
      else
        self.fill_indices(char, self.get_matching_indices(char))
      end
      @attempted_chars << char # method?
      true
    end
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    char = gets.chomp
    self.try_guess(char)
  end

  def win?
    if @guess_word.join("") == @secret_word 
      p 'WIN'
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      true
    else
      false
    end
  end

end
