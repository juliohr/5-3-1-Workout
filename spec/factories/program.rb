require 'faker'

FactoryGirl.define do
  factory :program do |f|
    f.person_name { Faker::Name.name }
  	f.one_rm_squat { Faker::Number.between(50, 150) }
  	f.one_rm_bench_press { Faker::Number.between(50, 150) }
  	f.one_rm_deadlift { Faker::Number.between(50, 150) }
  	f.one_rm_overhead_press { Faker::Number.between(50, 150) }
  	f.start_date { Faker::Date.between(2.days.ago, Date.today) }
  	f.cycle { Cycle.new() }
  end
end