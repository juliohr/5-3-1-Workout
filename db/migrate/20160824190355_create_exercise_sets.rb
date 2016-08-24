class CreateExerciseSets < ActiveRecord::Migration[5.0]
  def change
    create_table :exercise_sets do |t|
      t.integer :weight
      t.integer :reps

      t.timestamps
    end
  end
end
