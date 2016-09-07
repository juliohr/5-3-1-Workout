class AddStatusToWorkouts < ActiveRecord::Migration[5.0]
  def change
    add_column :workouts, :status, :integer
  end
end
