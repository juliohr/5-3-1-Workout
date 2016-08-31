class ChangeOneRmMaxFromExercises < ActiveRecord::Migration[5.0]
  def change
    rename_column :exercises, :one_rm_max, :one_rm
  end
end
