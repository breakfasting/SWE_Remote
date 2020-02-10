def bubble_sort(arr)
  sorted = false
  until sorted
    sorted = true
    (0...arr.length - 1).each do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        sorted = false
      end
    end
  end
  arr
end

prng = Random.new
array = (0..10).map { prng.rand(1000) }
p array
p bubble_sort(array)
