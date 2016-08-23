class AddLiftsToPrograms < ActiveRecord::Migration[5.0]
  def change
  	[:one_rm_squat, :one_rm_bench_press, :one_rm_deadlift, :one_rm_overhead_press].each do |l|
  		add_column :programs, l, :float
  	end
  end
end
