=begin
Employee : name, serial number, part-time or full-time(employment status)

  Executive : full-time employee, 20 days of vacation, work at a desk in the corner office, can delegate work

  Manager: Full-time employee, 14 days of vacation, work at a desk in a regular private office, can delegate work

  Regular employees: 10 days of vacation, Regular employees have a desk in a cubicle farm, cannot delegate work

  Part-time employees: no vacation, part-time employees work in an open workspace with no reserved desk, cannot delegate work


# full-time employees should have a #take_vacation method that gets called when an employee takes some vacation, part-time employees don't have this method
# - - The #take_vacation method should be a module Vacationable

# progam should be able to call a #delegate method on any manager or executive, no other employees should have a delegate method.
# - - make this into a module Delegatable

If you pass an employee instance to #puts, it should print information in this format:
      Name: Dave
      Type: Manager
      Serial number: 123456789
      Vacation days: 14
      Desk: private office
# - - define a to_s method for all employees.

# In particular, you don't need to show the code that fetches, adds, deletes, or updates employees.

=end
module Vacationable
  def take_vacation
  end
end

module Delegatable
  def delegate
  end
end

class Employee
  def initialize(name, serial_number)
    @name = name
    @serial_number = serial_number
  end

  def to_s
    <<~HEREDOC
    Name: #{@name}
    Type: #{@type}
    Serial Number: #{@serial_number}
    Vacation Days: #{@vacation_days}
    Desk: #{@desk_location}"
    HEREDOC
  end
end

class Executive < Employee
  include Vacationable
  include Delegatable

  def initialize(name, serial_number)
    super
    @type = "Executive"
    @vacation_days = 20
    @desk_location = "Corner Office"
  end
end

class Manager < Employee
  include Vacationable
  include Delegatable

  def initialize(name, serial_number)
    super
    @type = "Manager"
    @vacation_days = 14
    @desk_location = "Private Office"
  end
end

class Regular < Employee
  include Vacationable
  def initialize(name, serial_number)
    super
    @type = "Full-Time Employee"
    @vacation_days = 10
    @desk_location = "Cubicle Farm"
  end
end

class PartTime < Employee
  def initialize(name, serial_number)
    super
    @type = "Part-Time Employee"
    @vacation_days = 0
    @desk_location = "Cubicle Farm"
  end
end
