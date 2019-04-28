class User < ApplicationRecord
  validates :first_name, uniqueness: { scope: :last_name,
    message: "User already exist." }
end
