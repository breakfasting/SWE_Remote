# frozen_string_literal: true

def prime?(num)
  return false if num < 2

  (2...num).each do |i|
    return false if (num % i).zero?
  end
  true
end
