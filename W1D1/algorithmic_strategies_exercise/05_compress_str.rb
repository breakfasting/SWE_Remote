# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

# create empty new string
# create count var, in a while loop, increase count when char is same as last
# shove the count and letter to new string 

def compress_str(str)
    new_str = ""
    count = 1
    (0..str.length - 1).each do |i| # counts last
        if !str[i + 1].nil? && str[i] == str[i + 1] # i = 2 count = 3 a
            count += 1
        else
            if count == 1
                new_str += str[i]
            else
                new_str += count.to_s + str[i]
                count = 1
            end
        end #queue and stacks
    end
    new_str
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
