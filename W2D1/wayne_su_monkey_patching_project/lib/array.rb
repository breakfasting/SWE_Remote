# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.length == 0
        sorted = self.sort
        sorted[-1] - sorted[0]
    end

    def average
        return nil if self.empty?
        self.sum / (self.length * 1.0)
    end

    def median
        return nil if self.empty?

        sorted = self.sort
        if sorted.length % 2 == 1
            return sorted[sorted.length / 2]
        else
            return (sorted[(sorted.length / 2) - 1] + sorted[sorted.length / 2]) / 2.0
        end
    end

    def counts
        count = Hash.new(0)
        self.each do |ele|
            count[ele] += 1
        end
        count
    end

    # Part 2
    def my_count(val)
        count = 0
        self.each { |ele| count += 1 if ele == val }
        count
    end

    def my_index(val)
        self.each.with_index { |ele, i| return i if ele == val }
        nil
    end

    def my_uniq
        # count = Hash.new(0)
        # self.each { |ele| count[ele] += 1 }
        # count.keys
        new_arr = []
        self.each do |ele|
            if !new_arr.include?(ele)
                new_arr << ele
            end
        end
        new_arr
    end

    def my_transpose
        # trans = Array.new(self[0].length) { Array.new(self.length) }

        # (0...self.length).each do |i1|
        #     (0...self[0].length).each do |i2|
        #         trans[i2][i1] = self[i1][i2]
        #     end
        # end
        # trans

        
        # other = []
        
        # self[0].each_with_index do |ele1, i1|
        #     trans = []
        #     self.each_with_index do |ele2, i2|
        #         trans << self[i2][i1]
        #     end
        #     other << trans
        #     # p trans
        # end
        # other

        self[0].map.with_index { |ele, i1| self.map.with_index { |ele2, i2| self[i2][i1] } }
    end

end

matrix1 = [[1,2,3],[4,5,6]]
p matrix1.my_transpose