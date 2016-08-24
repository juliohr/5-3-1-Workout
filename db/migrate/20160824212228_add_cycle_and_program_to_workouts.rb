class AddCycleAndProgramToWorkouts < ActiveRecord::Migration[5.0]
  def change
    add_reference :workouts, :cycle, foreign_key: true
    add_reference :workouts, :program, foreign_key: true
  end
end
