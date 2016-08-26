class AddCycleWeekToWorkout < ActiveRecord::Migration[5.0]
  def change
    add_column :workouts, :cycle_week, :integer
  end
end
