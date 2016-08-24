class Program < ApplicationRecord
	has_many :cycles
	has_many :workouts, :through => :cycles
	
	validates_presence_of :person_name,
	:one_rm_squat,
	:one_rm_bench_press,
	:one_rm_deadlift,
	:one_rm_overhead_press,
	:start_date
end
