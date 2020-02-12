# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def largest_prime_factor(num)
  # debugger
  # (num..2).each do |idx|
  #     if num % idx == 0 && prime?(idx)
  #         return idx
  #     end

  # end
  i = num
  while i >= 2
    if num % i == 0 && prime?(i)
      return i
    end
    i -= 1
  end
end

def prime?(num)
  return false if num < 2

  (2...num).each do |factor|
    if num % factor == 0
      return false
    end
  end
  return true
end

def unique_chars?(str) #hello
  #debugger
  word_count = Hash.new(0)
  str.each_char do |char|
    if word_count[char] != 0
      return false
    else
      word_count[char] += 1
    end
  end
  true
end

p unique_chars?("computer")

def dupe_indices(array) # ["a", "b", "c", "c", "b"] -> { "b" => [1, 4], "c" => [2, 3] }
  dupe = {}
  array.each_with_index do |ele, i|
    if !dupe[ele].nil?
      dupe[ele] << i
    else
      dupe[ele] = [i]
    end
  end

  dupe.reject { |k, v| v.length < 2 }
  # dupe = Hash.new{Array.new()}
  # array.each_with_index do |ele , i|
  #      if dupe[ele] != nil
  #         dupe[ele] << i
  #      else
  #       dupe[ele] << i

  #     end
  # end
  # return dupe
end

def ana_array(arr1, arr2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  arr1.each do |ele|
    hash1[ele] += 1
  end
  arr2.each do |ele|
    hash2[ele] += 1
  end
  hash1 == hash2
end
