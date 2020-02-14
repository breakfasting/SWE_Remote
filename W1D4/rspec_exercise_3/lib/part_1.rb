def is_prime?(num)
    (2...num).each do |factor|
        return false if num % factor == 0
    end
    num >= 2
end

def nth_prime(n)
    count = 0
    i = 2
    while true
        if is_prime?(i)
            count += 1
            return i if n == count
        end
        i += 1
    end
end

def prime_range(min, max)
    prime_array = []
    (min..max).each do |num|
        if is_prime?(num)
            prime_array << num
        end
    end
    prime_array
end

