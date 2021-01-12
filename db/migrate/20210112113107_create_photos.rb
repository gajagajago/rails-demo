class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :photo_url
      t.timestamps
    end

    add_reference :articles, :photo, index: true, foreign_key: true
  end
end
