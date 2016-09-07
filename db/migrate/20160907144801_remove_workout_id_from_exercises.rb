class RemoveWorkoutIdFromExercises < ActiveRecord::Migration[5.0]
  def change
    remove_column :exercises, :workout_id, :integer
  end
end
