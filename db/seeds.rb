require 'faker'

# Create 10 User
10.times do
  User.create!(
    first_name: Faker::Name.first_name.downcase,
    last_name: Faker::Name.last_name.downcase
  )
end

# Create 5 Groups
5.times do
  group = Group.new(
    name: (Faker::Educator.subject + ' Group').downcase
  )
  group.save if group.valid?
end

user_ids = User.ids # collect all user's id
group_ids = Group.ids # collect all group's id

5.times do |n|
  group_id = group_ids[n] # get a group id

  # Create a event of this group there user role is organizer
  Event.create!(
    user_id: user_ids.sample, group_id: group_id, role: 0
  )
  # Create other events of this group there user role is presenter or participant
  (1..8).to_a.sample.times do
    event = Event.new(
      user_id: user_ids.sample, group_id: group_id, role: (1..2).to_a.sample
    )
    event.save if event.valid?
  end
end
