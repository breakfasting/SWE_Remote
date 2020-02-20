require 'byebug'

class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? { |ele| POSSIBLE_PEGS.has_key?(ele.upcase) }
  end

  attr_reader :pegs

  def self.random(num)
    rgby = "RGBY".split('')
    Code.new(Array.new(num) {rgby.sample}) #rgby[rand(num - 1)]
  end

  def self.from_string(str)
    Code.new(str.chars) # returns the Code instance
  end
  
  def initialize(char_arr)
    if !Code.valid_pegs?(char_arr)
      raise "Error!"
    else
      @pegs = char_arr.map(&:upcase)
    end
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
    guess.pegs.each.with_index do |ele, i|
      count += 1 if ele == @pegs[i]
    end
    count
  end

# expect(code.num_near_matches(
# Code.new(["R", "R", "R", "R"]))).to eq(2)

# copy:
# #<Code:0x00007fb27c9e9a90 @pegs=["R", "G", "R", "B"]>
# guess:
# #<Code:0x00007fb27c9e8fc8 @pegs=["R", "R", "R", "R"]>
#expect 2*exact 2*near

# secret: RYYB guess: RGRB 2,1
#expect 2*exact 0*near

# exact [0,2]
# [0,3]

  def num_near_matches(guess) # secret: RGRB guess: RYYB expect 2*exact 0*near
    # puts 'self:'
    # p self
    # puts 'guess:'
    # p guess
    # # p @pegs
    # copy = @pegs.dup # be sure to not mutate!
    # copy.each.with_index do |ele, i|      
    #   if ele == guess.pegs[i]
    #     copy[i] = '_'
    #   end
    # end
    # # p copy
    # count = 0
    # guess.pegs.each_with_index do |ele, i|
    #   if copy.include?(ele)
    #     count += 1
    #   end
    # end
    # count
    count = 0
    guess.pegs.each_with_index do |ele, i|
      if ele != @pegs[i] && @pegs.include?(ele)
        count += 1
      end
    end
    count
  end

  def ==(code)
    self.pegs == code.pegs
  end

end

