require 'faker'

FactoryGirl.define do
  factory :program do
    person_name { Faker::Name.name }
  	one_rm_squat { Faker::Number.between(50, 150) }
  	one_rm_bench_press { Faker::Number.between(50, 150) }
  	one_rm_deadlift { Faker::Number.between(50, 150) }
  	one_rm_overhead_press { Faker::Number.between(50, 150) }
  	start_date { Faker::Date.between(2.days.ago, Date.today) }
    after(:build) do |program|
      program.cycles << FactoryGirl.build(:cycle, program: program)
    end
  end
end