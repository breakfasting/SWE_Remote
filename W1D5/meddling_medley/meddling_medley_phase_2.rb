# Meddling Medley
# Phase 2: More difficult, maybe?

# conjunct_select
# Write a method conjunct_select that accepts an array and one or more procs as arguments. The method should return a new array containing the elements that return true when passed into all of the given procs.

def conjunct_select(arr, *prc_arr)
  arr.select do |ele|
    prc_arr.all? { |prc| prc.call(ele) }
  end
end

# Examples

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

# convert_pig_latin
# Write a method convert_pig_latin that accepts a sentence as an argument. The method should translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
# if the word begins with a non-vowel, move all letters that come before the word's first vowel to the end of the word and add 'ay' (example: 'trash'->'ashtray')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

# arr = sent.split
# new_arr to shovel
# iterate words
# -- word.length < 3 return word in map
# -- if word[0] == vowel, word += 'yay'
# -- if word[0] != vowel, word.index {char is vowel}, reconstruct to new_str += word[i..-1] + word[0...i]
# new_arr << new_str
# join

def convert_pig_latin(sent)
  vowels = "aeiouAEIOU"
  new_arr = []
  sent.split(" ").each do |word|
    capt = false
    if word.capitalize == word
      #acts as flag to make sure each word is capitalized correctly (like the original)
      capt = true
    end
    if word.length < 3
      new_arr << capt ? word.capitalize : word
    elsif vowels.include?(word[0])
      new_arr << (capt ? word.capitalize : word) + "yay"
    elsif !vowels.include?(word[0])
      i = word.chars.index { |char| vowels.include?(char) }
      new_arr << (capt ? (word[i..-1] + word[0...i]).capitalize : word[i..-1] + word[0...i]) + "ay"
    end
  end
  new_arr.join(" ")
end

# Examples

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

# reverberate
# Write a method reverberate that accepts a sentence as an argument. The method should translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
# if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, including the last vowel itself (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

def reverberate(sent)
  new_arr = []
  words_arr = sent.split(" ")
  vowels = "aeiouAEIOU"
  words_arr.each do |word|
    capt = false
    if word.capitalize == word
      capt = true
    end
    if word.length < 3
      new_arr << capt ? word.capitalize : word #new_arr << capt ? word.capitalize : word
    elsif vowels.include?(word[-1])
      new_arr << (capt ? (word * 2).capitalize : word * 2)
    elsif !vowels.include?(word[-1])
      rev_index = word.chars.reverse.index { |char| vowels.include?(char) }
      i = word.length - 1 - rev_index
      new_arr << (capt ? (word + word[i..-1]).capitalize : word + word[i..-1])
    end
  end
  new_arr.join(" ")
end

# Examples

p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

# disjunct_select
# Write a method disjunct_select that accepts an array and one or more procs as arguments. The method should return a new array containing the elements that return true when passed into at least one of the given procs.

def disjunct_select(arr, *prc_arr)
  arr.select { |el| prc_arr.any? { |prc| prc.call(el) } }
end

# Examples

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?("o") }
# starts_a = Proc.new { |s| s[0] == "a" }

# p disjunct_select(["ace", "dog", "apple", "teeming", "boot", "zip"],
#                   longer_four) # ["apple", "teeming"]

# p disjunct_select(["ace", "dog", "apple", "teeming", "boot", "zip"],
#                   longer_four,
#                   contains_o) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(["ace", "dog", "apple", "teeming", "boot", "zip"],
#                   longer_four,
#                   contains_o,
#                   starts_a) # ["ace", "dog", "apple", "teeming", "boot"]


# alternating_vowel
# Write a method alternating_vowel that accepts a sentence as an argument. The method should return a new sentence where the words alternate between having their first or last vowel removed. For example:

# the 1st word should be missing its first vowel
# the 2nd word should be missing its last vowel
# the 3rd word should be missing its first vowel
# the 4th word should be missing its last vowel
# ... and so on
# Note that words that contain no vowels should remain unchanged. Vowels are the letters a, e, i, o, u.

# def alternating_vowel(sent)
#     sent_arr = sent.split(' ')
#     (0..sent_arr.length - 1).each do |i|
#         if i.even?  # 1, 3, 5
#             ()
#         else        # 2, 4, 6
#           rev_index = sent_arr[i].chars.reverse.index { |char| vowels.include?(char) }
#           i = sent_arr[i].length - 1 - rev_index
#         end
#     end
# end

# Examples

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"