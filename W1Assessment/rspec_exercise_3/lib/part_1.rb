def is_prime?(num)
  (2...num).each do |i|
    if num % i == 0
      return false
    end
  end
  num >= 2
end

def nth_prime(n)
  count = 0
  i = 0
  while count < n
    if is_prime?(i)
      count += 1
    end
    i += 1
  end
  i - 1
end

def prime_range(min, max)
  prime_arr = []
  (min..max).each do |n|
    if is_prime?(n)
      prime_arr << n
    end
  end
  prime_arr
end