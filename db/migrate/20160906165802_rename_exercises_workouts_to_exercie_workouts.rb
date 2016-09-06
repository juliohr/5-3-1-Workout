class RenameExercisesWorkoutsToExercieWorkouts < ActiveRecord::Migration[5.0]
  def change
    rename_table :exercises_workouts, :exercise_workouts
  end
end
