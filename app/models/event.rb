class Event < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :group
  # validation
  validates_uniqueness_of :role, scope: %i[user_id group_id]

  enum role: [:organizer, :presenter, :participant]
end
