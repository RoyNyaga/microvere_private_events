class AddUserToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :user, foreign_key: true
  end
  add_index :events, %i[user_id created_at]
end
