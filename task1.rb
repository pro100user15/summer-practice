require 'date'

module Validation
  MAX_NAME_LENGTH = 40
  NAME_REGEX = /\A[A-Za-z\-]+\z/
  INN_REGEX = /\A[A-Z]{2}\d{10}\z/

  def self.valid_name?(string)
    string.length <= MAX_NAME_LENGTH && string.match?(NAME_REGEX)
  end

  def self.valid_inn?(string)
    string.match?(INN_REGEX)
  end

  def self.after_date?(date)
    date <= Date.today
  end
end

puts "\n========== Task 1: ==========\n\n"

puts Validation.valid_name?("Maria-Anna")  # true
puts Validation.valid_name?("Bogdan Tkachuk")  # false (contains a space)
puts Validation.valid_name?("NotValidName1")  # false (contains a number)
puts Validation.valid_name?("SoLongNameExpectToReturnFalseBecauseNameHasMoreFourtyLetters")  # false (too long)

puts "\n========== Task 2: ==========\n\n"

puts Validation.valid_inn?("AZ1234543456")  # true
puts Validation.valid_inn?("ABCD12345678")  # false (invalid format)
puts Validation.valid_inn?("AB123456789")  # false (invalid format only 9 numbers)

puts "\n========== Task 3: ==========\n\n"

puts Validation.after_date?(Date.today)  # true
puts Validation.after_date?(Date.new(2003, 11, 2))  # true
puts Validation.after_date?(Date.new(2033, 6, 28))  # false (future date)