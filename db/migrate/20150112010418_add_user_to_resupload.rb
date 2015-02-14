class AddUserToResupload < ActiveRecord::Migration
  def change
    add_column :resuploads, :user_id, :integer
  end
end
