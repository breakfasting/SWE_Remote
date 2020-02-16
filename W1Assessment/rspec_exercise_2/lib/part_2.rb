def palindrome?(str)
  i = 0
  while i < str.length / 2
    unless str[i] == str[str.length - 1 - i]
      return false
    end
    i += 1
  end
  return true
end

def substrings(str)
  sub_arr = []
  (0..str.length - 1).each do |i|
    (0..str.length - 1).each do |j|
      sub_arr << str[i..j] if j >= i
    end
  end
  sub_arr
end

def palindrome_substrings(str)
  p_sub_arr = []
  substrings(str).each do |ele|
    if ele.length > 1 && palindrome?(ele)
      p_sub_arr << ele
    end
  end
  p_sub_arr
end

# Done in 22m56s