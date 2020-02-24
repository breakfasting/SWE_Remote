class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(char_arr)
    char_arr.all? { |char| POSSIBLE_PEGS.include?(char.upcase) }
  end

  def initialize(char_arr)
    if !Code.valid_pegs?(char_arr)
      raise "ERROR: Not valid pegs"
    else
      @pegs = char_arr.map(&:upcase)
    end
  end
  
  def self.random(n)
    gen_char_arr = Array.new(n) { POSSIBLE_PEGS.keys.sample }
    Code.new(gen_char_arr)
  end

  def self.from_string(str)
    str_arr = str.split('')
    Code.new(str_arr)
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  # Part 2
  def num_exact_matches(guess)
    count = 0
    guess.pegs.each_with_index do |peg, i|
      count += 1 if peg == @pegs[i]
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    guess.pegs.each_with_index do |peg, i|
      if peg != @pegs[i] && @pegs.include?(peg)
        count += 1
      end
    end
    count
  end

  def ==(code)
    self.pegs == code.pegs
  end
end
