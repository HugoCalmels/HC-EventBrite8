class AddEventToAttendances < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendances, :event
  end
end
