FactoryBot.define do
  factory :event do
    role  { (0..2).to_a.sample }
  end
end
