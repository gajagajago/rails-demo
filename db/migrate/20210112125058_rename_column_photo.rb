class RenameColumnPhoto < ActiveRecord::Migration[6.0]
  def change
    rename_column :photos, :photo, :photo_url
    remove_column :articles, :photo_id
  end
end
