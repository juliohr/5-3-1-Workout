class AddExerciseToExerciseSets < ActiveRecord::Migration[5.0]
  def change
    add_reference :exercise_sets, :exercise, foreign_key: true
  end
end
