class Group < ApplicationRecord
  # association
  has_many :events
  has_many :users, through: :events

  def group_name
    name.titleize
  end

  def organizer_name
    event = events.organizer.first
    event.user.name
  end
end
