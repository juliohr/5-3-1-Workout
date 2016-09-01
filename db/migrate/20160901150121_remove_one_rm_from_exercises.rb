class RemoveOneRmFromExercises < ActiveRecord::Migration[5.0]
  def change
    remove_column :exercises, :one_rm, :integer
  end
end
