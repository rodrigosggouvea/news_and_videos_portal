class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title_pt
      t.string :title_es
      t.string :link

      t.timestamps null: false
    end
  end
end
