class AddPersonNameAndStartDateToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :person_name, :string
    add_column :programs, :start_date, :date
  end
end
