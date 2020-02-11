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
