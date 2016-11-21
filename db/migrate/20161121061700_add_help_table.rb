class AddHelpTable < ActiveRecord::Migration
  def change
    create_table :helps do |t|
      t.references :post, index: true, foreign_key: true
      t.references :tagged_post, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
    
    create_table :inspires do |t|
      t.references :post, index: true, foreign_key: true
      t.references :tagged_post, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
