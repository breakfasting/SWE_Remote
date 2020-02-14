# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
  ans = []
  hash = {}
  nums.each do |num|
    hash[num] = true
  end
  (1..nums.length).each do |n|
    if !hash.has_key?(n)
      ans << n
    end
  end
  ans
end
