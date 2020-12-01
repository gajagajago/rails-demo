class ReverDeletedAtFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :deleted_at
  end
end
