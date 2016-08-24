class AddWorkoutToExercises < ActiveRecord::Migration[5.0]
  def change
    add_reference :exercises, :workout, foreign_key: true
  end
end
