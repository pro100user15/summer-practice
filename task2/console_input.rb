require_relative "validation"
require 'date'
module ConsoleInput
  include Validation

  def get_input_name
    input = nil
    until input && Validation.valid_name?(input)
      print "Input name: "
      input = gets.chomp
    end
    input
  end

  def get_input_id
    input = nil
    until input && Validation.valid_id?(input)
      print "Input ID: "
      input = gets.chomp
    end
    input
  end

  def valid_date_format?(input)
    /^\d{4}-\d{2}-\d{2}$/.match?(input) && Validation.valid_date_of_birth?(Date.parse(input))
  rescue ArgumentError
    false
  end

  def get_input_date
    input = nil
    until input && valid_date_format?(input)
      print "Input date: "
      input = gets.chomp
    end
    Date.parse(input)
  end
end

