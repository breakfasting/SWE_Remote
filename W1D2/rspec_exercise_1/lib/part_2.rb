def hipsterfy(word)
  vowels = "aeiou"
  # new_word = ''
  # (word.length - 1..0).each do |i|
  #   char = word[i]
  #   if !vowels.include?(char)
  #     new_word << char
  #   end
  # end
  # new_word
  i = word.length - 1
  while i >= 0
    if vowels.include?(word[i])
      return word[0..i - 1] + word[i + 1..-1]
    end
    i -= 1
  end
  return word
end

def vowel_counts(str)
  vowel_count = Hash.new(0)
  vowel = "aeiou"

  str.downcase.each_char do |char|
    if vowel.include?(char)
      vowel_count[char] += 1
    end
  end
  return vowel_count
end

def caesar_cipher(msg, n)
  new_msg = ""
  alphabet = "abcdefghijklmnopqrstuvwxyz"

  msg.each_char do |char|
    if !alphabet.index(char).nil?
      idx = alphabet.index(char)
      new_msg << alphabet[(idx + n) % 26]
    else
      new_msg << char
    end
  end
  new_msg
end
