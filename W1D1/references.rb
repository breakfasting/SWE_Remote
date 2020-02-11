# str = "hello"
# p str.object_id
# str << "hello"
# p str.object_id
# str += "hello"
# p str.object_id

# << shovel mutates the string, += reassigns

arr = Array.new(3, "Hello")
arr[0] = "X"
p arr
# the initalize takes the argument