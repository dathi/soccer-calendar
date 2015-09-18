FactoryGirl.define do
  factory :team do
  	name Faker::Address.city
  	played_number Faker::Number.between(1, 40)
  	rank Faker::Number.between(1, 40)
  	points Faker::Number.between(0, 120)
  end
end