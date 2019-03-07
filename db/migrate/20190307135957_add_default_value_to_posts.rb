class AddDefaultValueToPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :done, :boolean, :default => false
  end
end
