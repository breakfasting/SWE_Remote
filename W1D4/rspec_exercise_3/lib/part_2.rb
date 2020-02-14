def element_count(arr)
  hash = Hash.new(0)
  arr.each do |ele|
    hash[ele] += 1
  end
  return hash
end

def char_replace!(str, hash)
  str.each_char.with_index do |char, i|
    if !hash[char].nil? # found char
      str[i] = hash[char]
    end
  end
  str
end

def product_inject(num_arr)
  num_arr.inject { |accum, el| accum * el }
end