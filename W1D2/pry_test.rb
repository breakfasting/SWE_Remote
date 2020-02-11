# frozen_string_literal: true

def prime?(num)
  (2...num).each do |i|
    return false if (num % i).zero?
  end
  num > 1
end
