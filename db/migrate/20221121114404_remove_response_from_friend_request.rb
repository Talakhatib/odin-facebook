class RemoveResponseFromFriendRequest < ActiveRecord::Migration[7.0]
  def change
    remove_column :friend_requests, :response, :boolean
  end
end
