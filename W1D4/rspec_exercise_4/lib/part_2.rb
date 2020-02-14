def proper_factors(num)
  new_arr = []
  (1...num).each do |fact|
    new_arr << fact if num % fact == 0
  end
  new_arr
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  aliquot_sum(num) == num
end

def ideal_numbers(n)
  new_arr = []
  i = 1
  while true
    if perfect_number?(i)
      new_arr << i
      if new_arr.length == n
        return new_arr
      end
    end
    i += 1
  end
end