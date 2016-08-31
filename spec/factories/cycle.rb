require 'faker'
FactoryGirl.define do
  factory :cycle do
    number { Faker::Number.between(1, 10) } 
  end
end