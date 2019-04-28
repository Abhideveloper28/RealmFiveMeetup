class User < ApplicationRecord
  # association
  has_many :events
  has_many :groups, through: :events
  # validation
  validates :first_name, uniqueness: { scope: :last_name,
    message: "User already exist." }

  def name
    (first_name + ' ' + last_name).titleize
  end
end
