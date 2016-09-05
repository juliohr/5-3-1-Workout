class RemoveProgramIdFromWorkouts < ActiveRecord::Migration[5.0]
  def change
    remove_reference :workouts, :program
  end
end
