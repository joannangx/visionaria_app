class AddDefaultValuesToProfile < ActiveRecord::Migration
  def change
    change_column :profiles, :info, :text, :default => ""
    change_column :profiles, :motivations, :text, :default => ""
    change_column :profiles, :priorities, :text, :default => ""
  end
end
