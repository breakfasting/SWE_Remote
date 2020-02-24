require_relative "code"

class Mastermind
  def initialize(n)
    @secret_code = Code.random(n)
  end

  def print_matches(guess_code)
    puts @secret_code.num_exact_matches(guess_code)
    puts @secret_code.num_near_matches(guess_code)
  end

  def ask_user_for_guess
    puts 'Enter a code'
    guess = Code.from_string(gets.chomp)
    print_matches(guess)
    return @secret_code == guess
  end
end

# Done in 15m44s
