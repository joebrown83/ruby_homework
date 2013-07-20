class Account < ActiveRecord::Base
  belongs_to :user
  attr_accessible :age, :first_name, :gender, :last_name

  validates :age, numericality: true
  validate :appropriate_gender

  def appropriate_gender
    if (not (gender.eql?("male") or  gender.eql?("female") or gender.eql?("N/A")))
      errors.add(:gender, "must be male, female, or N/A")
    end
  end

  def to_s
    "First name: #{first_name}, Last name: #{last_name}, Age: #{age}, Gender: #{gender}"
  end
end
