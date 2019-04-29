class Event < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :group

  # validation
  validates :user_id, :group_id, :role, presence: true
  validates_uniqueness_of :role, scope: %i[user_id group_id], message: "User already exist in this event."

  enum role: [:organizer, :presenter, :participant]

  def role_name
    role.titleize
  end
end
