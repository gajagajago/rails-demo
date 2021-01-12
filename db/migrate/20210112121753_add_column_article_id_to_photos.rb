class AddColumnArticleIdToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :article_id, :integer
  end
end
