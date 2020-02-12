def reverser(str, &prc)
  # new_str = ''
  # (0...str.length).each do |i|
  #   new_str << str[i])
  # end
  prc.call(str.reverse)
end

def word_changer(sent, &prc)
  arr = sent.split(' ').map do |ele|
    prc.call(ele)
  end
  arr.join(' ')
end

def greater_proc_value(num, prc1, prc2)
  if prc1.call(num) > prc2.call(num)
    prc1.call(num)
  else
    prc2.call(num)
  end
end

def and_selector(arr, prc1, prc2)
  arr.select { |ele| prc1.call(ele) && prc2.call(ele) }
end

def alternating_mapper(arr, prc1, prc2)
  arr.map.with_index do |ele, i|
    if i.even?
      prc1.call(ele)
    else
      prc2.call(ele)
    end
  end
end