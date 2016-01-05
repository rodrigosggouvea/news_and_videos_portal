class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true
      t.references :target

      t.timestamps null: false
    end
  end
end
