def element_count(arr)
  hash = Hash.new(0)
  arr.each { |ele| hash[ele] += 1 }
  hash
end

def char_replace!(str, hash)
  (0..str.length - 1).each do |i|
    if hash[str[i]]
      str[i] = hash[str[i]]
    end
  end
  str
end

def product_inject(num_arr)
  num_arr.inject { |acc, ele| acc * ele }
end

# Done in 8m43s