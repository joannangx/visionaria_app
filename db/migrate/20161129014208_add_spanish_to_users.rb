class AddSpanishToUsers < ActiveRecord::Migration
  def change
    add_column :users, :spanish, :boolean, default: false
  end
end
