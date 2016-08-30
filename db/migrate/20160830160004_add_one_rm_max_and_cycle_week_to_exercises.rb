class AddOneRmMaxAndCycleWeekToExercises < ActiveRecord::Migration[5.0]
  def change
    add_column :exercises, :one_rm_max, :integer
    add_column :exercises, :cycle_week, :integer
  end
end
