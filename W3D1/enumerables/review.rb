def factors(num)
    output = []
    (1..num).each { |number| output << number if num % number == 0 }
    output
end

class Array
    def bubble_sort!(&prc)
        prc ||= Proc.new { |ele, ele2| ele <=> ele2 }
        sorted = false
        while sorted == false
            sorted = true
            (0...self.length - 1).each do |i|
                if prc.call(self[i], self[i+1]) > 0
                    self[i], self[i+1] = self[i+1], self[i]
                    sorted = false
                end
            end
        end
        self
    end

    def bubble_sort(&prc)
		copy = self.dup
		copy.bubble_sort!(&prc)
    end
end

def substrings(string)
	output = []
	string.each_char.with_index do |char, i|
		(i...string.length).each do |i2|
			output << string[i..i2] if !output.include?(string[i..i2])
		end
	end
	output
end

def subwords(str, dict)
	sub_str = substrings(str)
	sub_str.select { |ele| ele if dict.include?(ele) }
end

# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).