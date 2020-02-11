# frozen_string_literal: true

require 'byebug'

def prime?(num)
  (2...num).each do |idx|
    return false if (num % idx).zero?
  end

  num > 1
end

debugger
prime?(17)
