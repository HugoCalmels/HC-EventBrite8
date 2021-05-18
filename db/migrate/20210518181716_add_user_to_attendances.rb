class AddUserToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendances, :user
  end
end
