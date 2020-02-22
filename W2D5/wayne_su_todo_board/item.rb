#PHASE 1

class Item
  attr_reader :deadline, :done
  attr_accessor :title, :description

  def self.valid_date?(date_string)
    date_arr = date_string.split('-')
    if date_arr[-1].to_i > 31 || date_arr[-1].to_i < 1
      return false
    elsif date_arr[-2].to_i > 12 || date_arr[-2].to_i < 1
      return false
    elsif date_arr[0].length != 4
      return false
    else
      return true
    end
  end

  def initialize(title, deadline, description)
    @title = title
    if Item.valid_date?(deadline)
      @deadline = deadline
    else
      raise "WRONG DATE!! FIX NOW"
    end
    @description = description
    @done = false
  end

  def deadline=(new_deadline)
    if Item.valid_date?(new_deadline)
      @deadline = new_deadline
    else
      raise "WRONG DATE!! FIX NOW"
    end
  end

  def toggle
    @done = !@done
  end

end


#_______________________________________________________________________________

# p Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')
# p Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )
# p Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date

# valid_date? test
# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false

