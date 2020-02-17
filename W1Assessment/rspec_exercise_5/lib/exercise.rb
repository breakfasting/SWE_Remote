def zip(*arrs)
  # i = 0
  # new_arr = []
  # while i < arrs[0].length
  #   new_arr << arrs.map { |arr| arr[i] }
  #   i += 1
  # end
  # new_arr
  arrs[0].map.with_index do |ar, i|
    arrs.map { |arr| arr[i] }
  end
end

def prizz_proc(arr, prc1, prc2)
  # new_arr = []
  arr.select { |ele| prc1.call(ele) != prc2.call(ele) }
end

def zany_zip(*arrs)
  longest_arr = arrs.inject do |acc, ele|
    if acc.length < ele.length
      ele
    else
      acc
    end
  end
  longest_arr.map.with_index do |ar, i|
    arrs.map { |arr| arr[i] }
  end
end

def maximum(arr, &prc)
  return nil if arr.empty?
  arr.inject { |acc, ele| prc.call(acc) <= prc.call(ele) ? ele : acc }
end

def my_group_by(arr, &prc)
  hash = Hash.new { |h, k| h[k] = [] }
  arr.each do |ele|
    hash[prc.call(ele)] << ele
  end
  hash
end

def max_tie_breaker(arr, prc, &block)
  return nil if arr.empty?
  arr.inject do |acc, ele|
    if block.call(ele) > block.call(acc)
      ele
    elsif block.call(ele) == block.call(acc)
      if prc.call(ele) > prc.call(acc)
        ele
      else
        acc
      end
    else
      acc # beware to ALWAYS ASSIGN ACC
    end
  end
end

def silly_syllables(sent)
  sent_arr = sent.split(' ')
  vowels = 'aeiou'
  sent_arr.map! do |word|
    if word.chars.count { |char| vowels.include?(char) } < 2
      word
    else
      remove_outside_vowels(word)
    end
  end
  sent_arr.join(' ')
end

def remove_outside_vowels(word)
  new_word = ''
  vowels = 'aeiou'
  first_vowel_found = false
  word.chars.inject('') do |acc, ele|
    if vowels.include?(ele)
      if first_vowel_found
        acc << ele
        new_word << acc
        acc = ''
      else
        new_word << ele
        first_vowel_found = true
        acc = ''
      end
    else
      acc << ele
    end
  end
  new_word
end

# Done in 37m36s