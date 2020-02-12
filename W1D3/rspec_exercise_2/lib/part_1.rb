
def partition(array, number)

  # twoD = Array.new(2) do

  # end
  lessArr = array.select { |ele| ele < number }
  greaterArr = array.select { |ele| ele >= number }
  ansArr = [lessArr, greaterArr] # == []
end

def merge(hash1, hash2)
  newHash = Hash.new()
  hash1.each { |k, v| newHash[k] = v }
  hash2.each { |k, v| newHash[k] = v }
  newHash
end

def censor(sent, array) # censor("Gosh darn it", ["gosh", "darn", "shoot"])
  vowels = "aeiouAEIOU"
  sentArr = sent.split(" ")
  sentArr.map! do |word|
    if array.include?(word.downcase)
      newWord = ""
      word.each_char { |char| vowels.include?(char) ? newWord += "*" : newWord += char }
      newWord
    else
      word
    end
  end
  sentArr.join(" ")
end

def power_of_two?(number)
  while number != 1
    if number % 2 == 0
      number /= 2
    else
      return false
    end
  end
  true
end

