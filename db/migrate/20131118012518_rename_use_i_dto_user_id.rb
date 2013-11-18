class RenameUseIDtoUserId < ActiveRecord::Migration
  def change
    rename_column :bookmarks, :use_id, :user_id
  end
end
