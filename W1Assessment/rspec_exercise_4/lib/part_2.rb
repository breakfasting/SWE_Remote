def proper_factors(num)
  new_arr = []
  (1...num).each do |i|
    if num % i == 0
      new_arr << i
    end
  end
  new_arr
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  num == aliquot_sum(num)
end

def ideal_numbers(n)
  new_arr = []
  count = 0
  i = 1
  while count < n
    if perfect_number?(i)
      count += 1
      new_arr << i
    end
    i += 1
  end
  new_arr
end

#  Done in 10m52s