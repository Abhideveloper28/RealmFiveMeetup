class Group < ApplicationRecord
  # association
  has_many :events
  has_many :users, through: :events
end
