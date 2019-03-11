class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :post, foreign_key: true
      t.boolean :read, default: false
      t.integer :recipient_id
      t.integer :actor_id
      t.string :action

      t.timestamps
    end
  end
end
