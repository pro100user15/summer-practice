require_relative "validation"
require_relative "consoleinput"

class Person
  include Validation
  include ConsoleInput

  attr_accessor :name, :id, :birth_date

  def initialize(full_name = nil, id = nil, birth_date = nil)
    set_name(full_name)
    set_id(id)
    set_birth_date(birth_date)
  end

  def set_name(full_name)
    @name = valid_name?(full_name) ? full_name : get_input_name
  end

  def set_id(id)
    @id = valid_id?(id) ? id : get_input_id
  end

  def set_birth_date(birth_date)
    @birth_date = valid_date_format?(birth_date) ? Date.parse(birth_date) : get_input_date
  end

  def info
    "All the info about the person:\nFull name: #{name}\nID: #{id}\nBirth date: #{birth_date}"
  end

  def validation
    "isName: #{valid_name?(name)}\nisID: #{valid_id?(id)}\nisBirthDate: #{valid_date_of_birth?(birth_date)}\nValidation passed: #{valid_name?(name) && valid_id?(id) && valid_date_of_birth?(birth_date)}"
  end
end