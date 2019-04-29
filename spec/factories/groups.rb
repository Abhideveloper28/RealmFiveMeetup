FactoryBot.define do
  factory :group do
    name  { (Faker::Educator.subject + ' Group').downcase }
  end
end
