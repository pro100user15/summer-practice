module Validation
  def self.valid_name?(name)
    name.match?(/\A[А-ЩЬЮЯІЇЄҐ][а-щьюяіїєґ]*(?:-[А-ЩЬЮЯІЇЄҐ][а-щьюяіїєґ]*)*\z/)
  end

  def self.valid_date_of_birth?(dob)
    dob.is_a?(Time) && dob < Time.now
  end

  def self.valid_id?(id)
    id.match?(/\A[A-Z]{2}\d{10}\z/)
  end
end