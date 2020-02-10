prng = Random.new
array = (0..10).map { prng.rand(2).even? }
p array

ans = array.inject(0) do |acc, ele|
  if ele
    acc + 1
  else
    acc
  end
end

# ans = array.inject(0) { |acc, ele| (acc + 1) if ele }

p ans
# arr = [1, 2, 3, 4]
# p arr.inject(0) { |acc, el| acc + el } 1231231231312312312312312312312312312312
