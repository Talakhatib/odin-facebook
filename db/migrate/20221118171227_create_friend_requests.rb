class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.boolean :response , default: false

      t.timestamps
    end
  end
end
