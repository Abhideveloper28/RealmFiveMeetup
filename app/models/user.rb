class User < ApplicationRecord
  # association
  has_many :events
  has_many :groups, through: :events

  # validation
  validates :first_name, :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name,
    message: "User already exist." }

  def name
    (first_name + ' ' + last_name).titleize
  end

  def self.get_user(data)
    User.find_or_create_by!(first_name: data['First Name']&.downcase, last_name: data['Last Name']&.downcase)
  end
end
