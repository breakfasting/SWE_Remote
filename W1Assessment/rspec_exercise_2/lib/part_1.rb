def partition(arr, num)
  arr2d = Array.new(2) { [] }
  # arr2d = [[], []]
  arr.each { |ele| ele >= num ? arr2d[1] << ele : arr2d[0] << ele }
  arr2d
end

def merge(hash1, hash2)
  new_hash = {}
  hash1.each { |h, k| new_hash[h] = k }
  hash2.each { |h, k| new_hash[h] = k }
  new_hash
end

def censor(sent, curse_arr)
  curse_arr.map!(&:downcase)
  # p curse_arr
  new_arr = []
  sent.split(' ').each do |word|
    if curse_arr.include?(word.downcase)
      new_arr << astrix_vowels(word)
    else
      new_arr << word
    end
  end
  new_arr.join(' ')
end

def astrix_vowels(word)
  vowels = 'aeiouAEIOU'
  new_word = ''
  word.each_char do |char|
    if vowels.include?(char)
      new_word << '*'
    else
      new_word << char
    end
  end
  new_word
end

def power_of_two? (num)
  while num != 1
    if num.even?
      num /= 2
    else
      return false
    end
  end
  true
end