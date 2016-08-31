class AddNumberToCycles < ActiveRecord::Migration[5.0]
  def change
    add_column :cycles, :number, :integer
  end
end
