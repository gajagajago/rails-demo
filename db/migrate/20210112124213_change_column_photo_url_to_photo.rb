class ChangeColumnPhotoUrlToPhoto < ActiveRecord::Migration[6.0]
  def change
    rename_column :photos, :photo_url, :photo
  end
end
