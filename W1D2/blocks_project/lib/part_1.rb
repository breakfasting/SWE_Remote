def select_even_nums(numarr)
  numarr.select { |ele| ele.even? }
end

def reject_puppies(hasharr)
  hasharr.reject { |ele| ele['age'] <= 2 }
end

def count_positive_subarrays(arr2d)
  arr2d.count { |ele| ele.sum > 0 }
end

def aba_translate(str)
  vowel = 'aeiou'
  arr = str.split('').map { |ele| vowel.include?(ele) ? ele + 'b' + ele : ele }
  arr.join('')
end

def aba_array(wordarr)
  wordarr.map { |ele| aba_translate(ele) }
end
