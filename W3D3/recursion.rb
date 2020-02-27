
def range(start, finish) # range(1, 3)
    return [finish] if start == finish

    [start] + range(start + 1, finish) 
end

# p range(1,5)
# p range(20,100)

def my_sum(array)
    sum = 0
    array.each do |num|
        sum += num
    end
    sum
end

def recursive_sum(array)
    return array[0] if array.length == 1

    sum = array[0] + recursive_sum(array[1..-1])
end

# a = [1,2,3,4,5]
# p recursive_sum(a)
# p a

def exp1(base, power)
    puts "exp1"
    return 1 if power == 0
    base * exp1(base, power - 1)
end

# arithmetic overflow

# p exp1(2, 100)

def exp2(base, power)
    puts "exp2"
    return 1 if power == 0
    return base if power == 1 #

    if power.even?
        exp2(base, power / 2) ** 2
    else
        base * ( exp2(base, (power - 1) / 2) ** 2 )
    end
end

# p exp2(2, 1000000)
class Array #[1,[2],3,[4],5]
    def deep_dup
        return self.dup if self.all? { |ele| !ele.is_a?(Array) }
        
        arr = []
        self.each do |ele|
            if !ele.is_a?(Array)
                arr << ele
            else
                arr << ele.deep_dup
            end
        end
        arr

        # self.map do |ele|
        #     if !ele.is_a?(Array)
        #         ele
        #     else
        #         ele.deep_dup
        #     end
        # end

        # self.map { |ele| ele.is_a?(Array) ? ele.deep_dup : ele }
    end
end

def fibonacci(n)
    return [1] if n == 1
    return [1,1] if n == 2

    fib = fibonacci(n -1)
    fib << fib[-2] + fib[-1]

end


def bsearch(array, target)  # ***
    return nil if array.empty?

    mid_idx = (array.length - 1) / 2
    return mid_idx if array[mid_idx] == target 
    
    if target < array[mid_idx]
        return bsearch(array[0...mid_idx], target) 
    else
        return bsearch(array[mid_idx + 1..-1], target) + mid_idx + 1
    end

end

# bsearch([1, 3, 4, 5, 9], 5)

# a = [1,[2],3,[4],5]
# b = a.deep_dup

def merge_sort(array) # ***
    return array if array.length <= 1
    mid_idx = (array.length - 1) / 2

    first_half = merge_sort(array[0..mid_idx])
    second_half = merge_sort(array[mid_idx + 1..-1])

    merge(first_half, second_half)
    # merge(merge_sort(array[0..mid_idx]), merge_sort(array[mid_idx + 1..-1]))
end


def merge(arr1, arr2) # [1,2,3] [1,5,6]
    merged = []
    while !arr1.empty? || !arr2.empty?
        arr1_first = arr1.shift # 1
        arr2_first = arr2.shift # nil
        if arr2_first == nil
            merged << arr1_first
        elsif arr1_first == nil
            merged << arr2_first
        elsif arr1_first <= arr2_first
            merged << arr1_first
            arr2.unshift(arr2_first) 
        elsif arr2_first < arr1_first
            merged << arr2_first
            arr1.unshift(arr1_first)
        end
    end
    merged
end

# subsets([array of n items]) = subsets([arr with first n - 1 items]) + subsets([arr with first n - 1 items]) in combination with last item in array

def subsets(array) # [1, 2], [1]
    return [[]] if array.length == 0
    # return [[], array ] if array.length == 1

    except_last = subsets(array[0...-1]) #subsets([1]), subsets([])
    combination = except_last.map { |ele| ele += [array[-1]]} #map subsets([1]) + [2], 

    except_last + combination
end



#Permutations(array with length n - 1) = [[1, 2], [2, 1]]
#array[n] = [3]
#Permutations(n) = [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]

def permutations(array)
    #base case
    return [[]] if array.empty?

    results = []
    prev_perm = permutations(array[0...-1]) # permutations([1,2]) == [[1, 2], [2, 1]]
    last_ele = array[-1] # 3
    prev_perm.each do |sub_arr|
        (0...array.length).each do |idx|
            # temp = Array.new(array.length) [nil, nil, nil]
            # temp = sub_arr[0...idx] + [last_ele] + sub_arr[idx..-1]
            results << temp
        end
    end
    results
end




def put_into_place(array, idx, something) #[1,2] , 0, something = 3
    result = Array.new(array.length + 1)
    result[idx] = something # [3, nil, nil]
    result.each
end
