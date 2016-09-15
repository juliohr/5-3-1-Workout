class RemovePersonNameFromPrograms < ActiveRecord::Migration[5.0]
  def change
    remove_column :programs, :person_name, :string
  end
end
