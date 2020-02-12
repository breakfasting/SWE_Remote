def palindrome?(string)
  newWord = ""
  string.each_char do |char|
    newWord = char + newWord
  end
  newWord == string
end

def substrings(string) # jump => ["j", "ju", "jum", "jump", "u", "um", "ump", "m", "mp", "p"]
  array = []
  string.each_char.with_index do |char, i|
    string.each_char.with_index do |char2, j|
      array << string[i..j] if j >= i
    end
  end
  array
end

def palindrome_substrings(string)
  array = []
  subStrArr = substrings(string)
  subStrArr.each { |str| array << str if palindrome?(str) && str.length > 1 }
  array
end
