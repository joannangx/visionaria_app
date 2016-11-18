class AddMeritFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sash_id, :integer
    add_column :users, :level,   :integer, :default => 0
    add_column :users, :point,   :integer, :default => 0
  end
end
