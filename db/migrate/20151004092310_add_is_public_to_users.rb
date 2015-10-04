class AddIsPublicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ispublic, :boolean
  end
end
