class AddProgramIdToCycles < ActiveRecord::Migration[5.0]
  def change
    add_reference :cycles, :program, foreign_key: true
  end
end
