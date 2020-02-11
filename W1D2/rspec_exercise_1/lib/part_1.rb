def average(num1, num2)
  (num1 + num2) / 2.0
end

def average_array(arr)
  arr.sum / (arr.length * 1.0)
end

def repeat(str, num)
  new_str = ""
  num.times do
    new_str << str
  end
  new_str
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(sent)
  new_arr = []
  arr = sent.split(" ")
  arr.each_with_index do |word, i|
    if i.even?
      new_arr << word.upcase
    else
      new_arr << word.downcase
    end
  end
  new_arr.join(" ")
end
