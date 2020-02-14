require "byebug"

def zip(*arrays)
new_2d_arr = []
    (0..arrays[0].length - 1).each do |i|
    new_arr = []
        arrays.each do |sub_arr|
        new_arr << sub_arr[i]
        end
    new_2d_arr << new_arr
    end
#   arrays.each do |sub_arr| 
#     new_sub = []
#     sub_arr.each_with_index do |ele, i|
#       new_sub << sub_arr[i]
#     end
    # new_arr << new_sub
#   end
new_2d_arr
end


# new_arr[ ele that satisfy only one of the procs ]
def prizz_proc(arr, prc1, prc2)
  new_arr = []
  arr.each do |ele|
    new_arr << ele if prc1.call(ele) != prc2.call(ele) # THIS IS NICE, instead of XOR
  end
  new_arr
end

def zany_zip(*arrays)
  # zip(*arrays)
  # inject to find the longest array of the arrays
  max_length = longest_arr(arrays) # [['a', 'b', 'c'],[4,4,4,4,4],[5,5,5,5,5,5]]
  # debugger

  new_2d_arr = []
  (0..max_length - 1).each do |i|
    new_arr = []
    arrays.each do |sub_arr|
      new_arr << sub_arr[i]
    end
  new_2d_arr << new_arr
  end
  new_2d_arr
end

def longest_arr(arrays)
  max_length = arrays.inject(0) do |acc, el|
    if acc > el.length
      acc
    else
      el.length
    end
  end
  max_length
end


def maximum(array, &prc)
    array.inject { |accum, el| prc.call(el) >= prc.call(accum)? el : accum}
end

# [car, dog, mouse, horse] -> {3 => car,dog , 5 => mouse, horse}
# hash { prc.call(ele) => [ele, ele, ele] }
def my_group_by(array, &prc)
    # hash = Hash.new { |hash, key| hash[key] = [] } => to create empty array for value
    hash = {}
    array.each do |ele|
      if hash[prc.call(ele)] 
        hash[prc.call(ele)] << ele 
      else
        hash[prc.call(ele)] = [ele] # => need for shovel to work (failsafe)
      end
    end
    hash
end

def max_tie_breaker(array, prc, &block)
  return nil if array.length == 0
  array.inject do |accum, ele|
    if block.call(accum) > block.call(ele) 
      accum
    elsif block.call(accum) == block.call(ele) #tie breaker
      prc.call(accum) >= prc.call(ele)? accum : ele
    else
      ele
    end
  end
end

# breakup sent using split
# find the first and last vowel of each word
# new_arr << modified word
# join back up

def silly_syllables(sentence)
    new_arr = []
    sent_arr = sentence.split(' ')
    vowels = 'aeiou'
    sent_arr.each do |word|
        if word.chars.count {|el| vowels.include?(el)} < 2
            new_arr << word
        else
            start = word.chars.index {|el| vowels.include?(el)}
            finish = word.chars.reverse.index {|el| vowels.include?(el)}
            finish_index = word.chars.length - finish - 1
            new_arr << word[start..finish_index]
        end

    end
    new_arr.join(' ')
end
