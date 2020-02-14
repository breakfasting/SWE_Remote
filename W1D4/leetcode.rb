def product_except_self(nums)
    output = []
    nums.each_with_index do |num, i|
        prod = 1
        nums.each_with_index do |x, i2|
            if i != i2
                prod *= x
            end
        end
        output << prod
    end
    output
end

# Input:  [1,2,3,4]
# Output: [24,12,8,6]