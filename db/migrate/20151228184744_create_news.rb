class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title_pt
      t.string :title_es
      t.string :text_pt
      t.string :text_es
      t.references :user, index: true, foreign_key: true, nul: false

      t.timestamps null: false
    end
  end
end
