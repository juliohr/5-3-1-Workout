class RemoveCycleWeekFromExercise < ActiveRecord::Migration[5.0]
  def change
    remove_column :exercises, :cycle_week, :integer
  end
end
