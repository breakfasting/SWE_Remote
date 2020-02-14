def product_except_self(nums)
    length = nums.length
    newArr = Array.new(length, 1)
    (1..length - 1).each do |i|
        newArr[i] = newArr[i-1] * nums[i-1]
    end

    r = 1
    (1..length - 1).each do |i|
        r *= nums[length - i]
        newArr[length - 1 - i] = newArr[length - 1 - i] * r
    end
    newArr
end

Input:  [1,2,3,4]
Output: [24,12,8,6]