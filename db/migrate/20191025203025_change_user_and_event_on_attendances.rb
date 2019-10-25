class ChangeUserAndEventOnAttendances < ActiveRecord::Migration[5.2]
  def change
    rename_column :attendances, :events_id, :attended_event_id
    rename_column :attendances, :user_id, :attendee_id
  end
end
