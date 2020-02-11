# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.


#find divisor for each number starting at 1..lower_number
#go through all and check if there are any other diviors besides 1
#return false if more divisors found otherwise true

def coprime?(num_1, num_2)
    if num_1 < num_2
        n = num_1
    else
        n = num_2
    end

    (2..n).each do |i|
        if num_1 % i == 0 && num_2 % i == 0
            return false
        end
    end
    return true
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false


