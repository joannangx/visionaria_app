class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.text :info
      t.text :motivations
      t.text :priorities
      
      t.timestamps null: false
    end
  end
end
