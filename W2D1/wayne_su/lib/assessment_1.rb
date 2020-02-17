# Define your methods here.

def my_map!(arr, &prc)
  (0..arr.length - 1).each do |i|
    arr[i] = prc.call(arr[i])
  end
end

def two?(arr, &prc)
  count = 0
  arr.each do |ele|
    if prc.call(ele)
      count += 1
    end
  end
  count == 2
end

def nor_select(arr, prc1, prc2)
  new_arr = []
  arr.each do |ele|
    if !prc1.call(ele) && !prc2.call(ele)
      new_arr << ele
    end
  end
  new_arr
end

def array_of_hash_sum(hashes)
  all_sum = 0
  hashes.each do |hash|
    hash_sum = 0
    hash.each do |k, v|
      hash_sum += v
    end
    all_sum += hash_sum
  end
  all_sum
end

def slangify(sent)
  
  sent_arr = sent.split(' ')
  map_arr = sent_arr.map do |word|
    remove_first_vowel(word)
  end
  map_arr.join(' ')
end

def remove_first_vowel(word)
  vowels = 'aeiou'
  i = word.chars.index do |char|
    vowels.include?(char)
  end
  new_word = ''
  word.each_char.with_index do |c, idx|
    if i != idx
      new_word << c
    end
  end
  new_word
  # new_word = ''
  # found = false
  # word.each_char do |char|
  #   if found
  #     new_word<< char
  #   else
  #     if vowels.include?(char)
  #       found = true
  #     else
  #       new_word << char
  #     end
  #   end
  # end
  # new_word
end

p slangify('should accept a string as the first arg')

def char_counter(str, *chars)
  # if chars.empty?
  #   chars = str.chars
  # end
  # hash = Hash.new(0)
  # chars.each do |target_char|
  #   count = 0
  #   str.each_char do |char|
  #     if char == target_char
  #       count += 1
  #     end
  #   end
  #   hash[target_char] = count
  # end
  # hash
  hash = Hash.new(0)
  chars.each { |c| hash[c] = 0 }
  str.each_char do |char|
    if chars.include?(char)
      hash[char] += 1
    elsif chars.empty?
      hash[char] += 1
    end
  end
  hash
end