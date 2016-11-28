class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :amount, default: 0
      t.string :variety
      t.integer :level, default: 0

      t.timestamps null: false
    end
  end
end
