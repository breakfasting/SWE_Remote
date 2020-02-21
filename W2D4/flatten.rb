def flatten(data)
  return data if !data.is_a?(Array)

  temp = data.map do |ele|
    if ele.is_a?(Array)
      flatten(ele)
    else
      ele
    end
  end
  p temp
  temp
end

p flatten([1, [2, 3, 4], [2, 3]])
