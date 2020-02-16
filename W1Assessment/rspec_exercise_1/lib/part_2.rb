def hipsterfy(word)
  vowel = 'aeiou'
  new_word = ''
  return word if word.chars.none? {|char| vowel.include?(char)}
  i = word.length - 1
  while i >= 0
    if vowel.include?(word[i])
      return word[0...i] + word[i+1..-1]
    end
    i -= 1
  end
end

def vowel_counts(str)
  hash = Hash.new(0)
  vowels = 'aeiouAEIOU'
  str.each_char do |char|
    if vowels.include?(char)
      hash[char.downcase] += 1
    end
  end
  hash
end

def caesar_cipher(msg, n)
  alphabet = 'abcdefghijklmnopqrstuvwxyz'
  new_msg = ''
  msg.each_char do |char|
    if alphabet.index(char)
      i = alphabet.index(char)
      new_msg << alphabet[ (i + n) % 26 ]
    else
      new_msg << char
    end
  end
  new_msg
end

# Done in 16m03s
