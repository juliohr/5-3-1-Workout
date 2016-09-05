class Program < ApplicationRecord
	has_many :cycles
	
	validates_presence_of :person_name,
	:one_rm_squat,
	:one_rm_bench_press,
	:one_rm_deadlift,
	:one_rm_overhead_press,
	:start_date
  :cycles

  def initialize_cycle
  	first_cycle = Cycle.new({number: 1})
  	first_cycle.initialize_workouts({
  		one_rm_squat: one_rm_squat,
  		one_rm_bench_press: one_rm_bench_press,
  		one_rm_deadlift: one_rm_deadlift,
  		one_rm_overhead_press: one_rm_overhead_press
  		})
		cycles << first_cycle
  end
end
