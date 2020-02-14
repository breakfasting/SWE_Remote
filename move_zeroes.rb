# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  count = 0
  i = 0
  while i < nums.length - 1
    if nums[i] == 0
      nums.delete_at(i)
      count += 1
      i -= 1
    end
    i += 1
  end
  count.times { nums.push(0) }
  nil
end
