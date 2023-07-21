require "test/unit"
require_relative "person"

class PersonTest < Test::Unit::TestCase
  def setup
    @person = Person.new("Bogdan", "id32423422356", "2003-01-28")
  end

  def test_valid_names
    valid_names = ['Bogdan', 'Bogdan-Kit', 'Anna-Maria']
    valid_names.each do |name|
      define_method("test_valid_name_#{name}") do
        @person.name = name
        assert_equal(name, @person.name, "Name #{name} is valid")
      end
    end
  end

  def test_invalid_names
    invalid_names = ['12345', '-Julia', 'Julia_423']
    invalid_names.each do |name|
      define_method("test_invalid_name_#{name}") do
        assert_raise(ArgumentError) { @person.name = name }
      end
    end
  end

  def test_valid_ids
    valid_ids = ['id0123456789', 'id9876543210', 'ID1234567890']
    valid_ids.each do |id|
      define_method("test_valid_id_#{id}") do
        @person.id = id
        assert_equal(id, @person.id, "ID #{id} is valid")
      end
    end
  end

  def test_invalid_ids
    invalid_ids = ['12345', 'ID12645678901', 'AHCD1232256789']
    invalid_ids.each do |id|
      define_method("test_invalid_id_#{id}") do
        assert_raise(ArgumentError) { @person.id = id }
      end
    end
  end

  def test_valid_birth_dates
    valid_birth_dates = ['2003-01-28', '1999-11-31', '1999-05-05']
    valid_birth_dates.each do |birth_date|
      define_method("test_valid_birth_date_#{birth_date}") do
        @person.birth_date = birth_date
        assert_equal(birth_date, @person.birth_date, "Birth date #{birth_date} is valid")
      end
    end
  end

  def test_invalid_birth_dates
    invalid_birth_dates = ['2049-01-01', '2999-09-09', '2440-10-01']
    invalid_birth_dates.each do |birth_date|
      define_method("test_invalid_birth_date_#{birth_date}") do
        assert_raise(ArgumentError) { @person.birth_date = birth_date }
      end
    end
  end
end