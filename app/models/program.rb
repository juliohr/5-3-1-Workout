class Program < ApplicationRecord
  belongs_to :user
	has_many :cycles, dependent: :destroy
	
	validates_presence_of :one_rm_squat,
  	:one_rm_bench_press,
  	:one_rm_deadlift,
  	:one_rm_overhead_press,
  	:start_date,
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
