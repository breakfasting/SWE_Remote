def average(num1, num2)
  (num1 + num2) / 2.0
end

def average_array(num_arr)
  num_arr.sum * 1.0 / num_arr.length 
end

def repeat(str, num)
  new_str = ''
  num.times { new_str << str }
  new_str
end

def yell(str)
  str.upcase + '!'
end

def alternating_case(sent)
  sent_arr = sent.split
  new_arr = []
  (0..sent_arr.length - 1).each do |i|
    if i.even?
      new_arr << sent_arr[i].upcase
    else
      new_arr << sent_arr[i].downcase
    end
  end
  new_arr.join(' ')
end