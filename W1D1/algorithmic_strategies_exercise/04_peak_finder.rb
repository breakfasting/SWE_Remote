# Write a method, peak_finder(arr), that accepts an array of numbers as an arg.
# The method should return an array containing all of "peaks" of the array.
# An element is considered a "peak" if it is greater than both it's left and right neighbor.
# The first or last element of the array is considered a "peak" if it is greater than it's one neighbor.

# range to iterate through array
# beware of edge cases
# find if i > i- 1 and i > i + 1
# create empty array to shovel peaks

def peak_finder(arr)
    new_arr = []
    if arr[0] > arr[1]
        new_arr << arr[0]
    end

    (1...arr.length - 1).each do |idx|
        if arr[idx] > arr[idx - 1] && arr[idx] > arr[idx + 1]
            new_arr << arr[idx]
        end
    end

    if arr[-1] > arr[-2]
        new_arr << arr[-1]
    end

    new_arr
end
p peak_finder([1, 3, 5, 4])         # => [5]
p peak_finder([4, 2, 3, 6, 10])     # => [4, 10]
p peak_finder([4, 2, 11, 6, 10])    # => [4, 11, 10]
p peak_finder([1, 3])               # => [3]
p peak_finder([3, 1])               # => [3]
