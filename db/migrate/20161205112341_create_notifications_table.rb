class CreateNotificationsTable < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string   :action
      t.string   :post
      t.integer  :action_id
      t.integer  :user_id
      t.integer  :post_id
      t.integer  :tagged_post_id
      t.text     :message, default: ""
      
      t.timestamps null: false
    end
  end
end
