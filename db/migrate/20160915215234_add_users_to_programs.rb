class AddUsersToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_reference :programs, :user, foreign_key: true
  end
end
