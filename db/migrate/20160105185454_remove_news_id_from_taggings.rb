class RemoveNewsIdFromTaggings < ActiveRecord::Migration
  def change
    remove_foreign_key :taggings, column: :news_id
    change_table :taggings do |t|
      t.remove :news_id
      t.references :taggable, index: true, polymorphic: true
    end
  end
end
