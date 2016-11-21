class Points < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :regular, default: 0
      t.integer :poverty, default: 0
      t.integer :hunger, default: 0
      t.integer :health, default: 0
      t.integer :education, default: 0
      t.integer :gender, default: 0
      t.integer :sanitation, default: 0
      t.integer :energy, default: 0
      t.integer :economy, default: 0
      t.integer :industry, default: 0
      t.integer :inequalities, default: 0
      t.integer :cities, default: 0
      t.integer :consumption, default: 0
      t.integer :climate, default: 0
      t.integer :water, default: 0
      t.integer :land, default: 0
      t.integer :peace, default: 0
      t.integer :partnerships, default: 0
    end
  end
end
