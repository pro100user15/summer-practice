require_relative "person"

class PersonRepository
  def initialize
    @people = []
  end

  def add(person)
    raise ArgumentError, "Error" unless person.is_a?(Person)
    @people << person
  end

  def show
    @people.each { |person| puts person.info }
  end

  def get
    @people
  end

  def get_by_id(id)
    @people.find { |person| person.id == id }
  end

  def delete_by_id(id)
    person = get_by_id(id)
    @people.delete(person) if person
  end
end

