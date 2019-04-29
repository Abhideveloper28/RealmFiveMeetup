class Group < ApplicationRecord
  # association
  has_many :events, dependent: :destroy
  has_many :users, through: :events

  # validation
  validates :name, presence: true
  validates :name, uniqueness: true

  scope :valid_group, -> { joins(:events).where("events.user_id is NOT NULL") }

  def group_name
    name.titleize
  end

  def organizer_name
    event = events.organizer.first
    event.user.name if event
  end

  def self.get_group(data)
    Group.find_or_create_by!(name: data['Group Name']&.downcase)
  end
end
