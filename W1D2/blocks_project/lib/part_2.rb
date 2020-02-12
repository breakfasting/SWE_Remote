def all_words_capitalized?(wordarr)
  wordarr.all? { |ele| ele.capitalize == ele }
end

def no_valid_url?(urlarr)
  urlarr.none? { |ele| ele.end_with?('.com', '.net', '.io', '.org') }
end

def any_passing_students?(hasharr)
  hasharr.any? { |ele| (ele[:grades].sum / ele[:grades].length) >= 75}
end

