# My Each

class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end
    
    def my_select(&prc)
        output = []
        self.my_each { |ele| output << ele if prc.call(ele) }
        output
    end

    def my_reject(&prc)
        output = []
        self.my_each { |ele| output << ele unless prc.call(ele) }
        output
    end

    def my_any?(&prc)
        self.my_each { |ele| return true if prc.call(ele) }
        false
    end

    def my_all?(&prc)
        self.my_each { |ele| return false if !prc.call(ele) }
        true
        # count = 0
        # self.my_each { |ele| count += 1 if prc.call(ele) }
        # count == self.length
    end

    def my_flatten
        output = []
        self.my_each do |ele|
            if ele.is_a?(Array)
                output += ele.my_flatten
            else
                output << ele
            end
        end
        output
    end
    
    def my_zip(*arrays)
        output = Array.new(self.length) { [] }
        (0...self.length).each do |i|
            output[i] << self[i]
            (0...arrays.length).each do |j|
                output[i] << arrays[j][i]
            end
        end
        output
    end

    def my_rotate(num = 1)
        copy = self.dup
        if num >= 0
            num.times { copy << copy.shift }
        else
            (num * -1).times { copy.unshift(copy.pop) }
        end
        copy
    end

    def my_join(glue = '')
        output = ''
        i = 0
        while i < self.length - 1
            output += self[i]
            output += glue
            i += 1
        end
        output += self[-1]
    end

    def my_reverse
        output = []
        i = self.length - 1
        while i >= 0
            output << self[i]
            i -= 1
        end
        output
    end
end