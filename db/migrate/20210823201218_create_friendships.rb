class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :friend_a, class_name: 'User', null: false
      t.references :friend_b, class_name: 'User', null: false

      t.timestamps
    end
  end
end
