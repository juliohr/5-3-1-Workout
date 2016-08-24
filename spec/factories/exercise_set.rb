require 'faker'

FactoryGirl.define do
  factory :exercise_set do
    weight { Faker::Number.between(50, 150) }
  	reps { Faker::Number.between(1, 20) }
  end
end