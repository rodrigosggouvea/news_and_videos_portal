class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :gradable, polymorphic: true, index: true
      t.integer :grade

      t.timestamps null: false
    end
  end
end
