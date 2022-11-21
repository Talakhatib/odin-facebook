class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    change_table :friends do |t|
      t.rename :from_user_id, :current_user_id
      t.rename :to_user_id, :other_user_id
    end
  end
end
