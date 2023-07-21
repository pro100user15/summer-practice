require "test/unit"
require_relative "repository"
require_relative "person"

class PersonRepositoryTest < Test::Unit::TestCase
  def setup
    @repository = PersonRepository.new
    @person1 = Person.new("Bogdan", "AA0123456789", "1999-01-01")
    @person2 = Person.new("Kit", "BB9876543210", "1999-05-05")
    @repository.add(@person1)
    @repository.add(@person2)
  end

  def test_add_person
    assert_equal(2, @repository.get.length)

    person3 = Person.new("Andry", "CC2468135790", "2003-1-28")
    @repository.add(person3)

    assert_equal(3, @repository.get.length)
    assert_includes(@repository.get, person3)
  end

  def test_add_invalid_person
    invalid_person = "Invalid Instance"
    assert_raise(ArgumentError) { @repository.add(invalid_person) }
    assert_equal(2, @repository.get.length)
  end

  def test_delete_person_by_id
    assert_equal(2, @repository.get.length)

    @repository.delete_by_id("BB9876543210")

    assert_equal(1, @repository.get.length)
    assert_not_includes(@repository.get, @person2)
  end

  def test_get_all_people
    all_people = @repository.get
    assert_equal(2, all_people.length)
    assert_includes(all_people, @person1)
    assert_includes(all_people, @person2)
  end

  def test_get_person_by_id
    person = @repository.get_by_id("AA0123456789")
    assert_equal(@person1, person)
  end

  def test_get_person_by_invalid_id
    person = @repository.get_by_id("99999")
    assert_nil(person)
  end

  def test_show
    assert_output(/Bogdan.*Kit/m) { @repository.show }
  end

  def test_person_validation
    assert_true(Validation.valid_id?("AA0123456789"))
    assert_false(Validation.valid_id?("12345"))
    assert_false(Validation.valid_id?("AA01234567890"))
    assert_false(Validation.valid_id?("ABCD123456789"))

    assert_true(Validation.valid_date_of_birth?(Time.new(1999, 1, 1)))
    assert_false(Validation.valid_date_of_birth?(Time.now))
    assert_false(Validation.valid_date_of_birth?("1999-01-01"))
  end
end