require 'faker'
FactoryGirl.define do 
	factory :workout do 
    cycle_week { Faker::Number.between(1, 4) }
    status { Faker::Number.between(1, 3) }
    cycle
	end
end