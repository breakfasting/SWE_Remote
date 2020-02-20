require "employee"

class Startup

  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries) # {`title` => `salary`}
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.keys.include?(title)
  end

  def >(startup)
    self.funding > startup.funding
  end

  def hire(name, title)
    if !valid_title?(title)
      raise error
    else
      @employees << Employee.new(name, title)
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    if @funding >= @salaries[employee.title]
      @funding -= @salaries[employee.title]
      employee.pay(@salaries[employee.title])
    else
      raise error #
    end
  end

  def payday
    @employees.each {|employee| pay_employee(employee)}
  end

  def average_salary
    @employees.inject(0) {|acc, ele| acc += @salaries[ele.title]} / @employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding
    startup.salaries.each do |k, v|
        @salaries[k] = v if !@salaries[k]
    end
    startup.employees.each do |emp|
        @employees << emp
    end
    startup.close
  end

end


