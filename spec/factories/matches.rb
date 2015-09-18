FactoryGirl.define do
  factory :match do
  	happen_time Faker::Date.backward(Faker::Number.between(1, 100))
  	home Faker::Address.city
  	guest Faker::Address.city

  	trait :has_not_happened_yet do
      score "? - ?"
  	end
  	trait :has_happened do
  	  score "3 - 2"
  	end
  end
end