class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :commentable, polymorphic: true, index: true
      t.string :locale, null: false
      t.boolean :moderated, null: false, default: false
      t.text :message, null: false

      t.timestamps null: false
    end
  end
end
