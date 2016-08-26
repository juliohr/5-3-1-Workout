class CreateExercisesWorkoutsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises_workouts, id: false do |t|
    	t.belongs_to :exercise, index: true
    	t.belongs_to :workout, index: true
    end
  end
end
