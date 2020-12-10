class AssignUser1ToAllExistingArticles < ActiveRecord::Migration[6.0]
  def change
    Article.update_all(user_id: 1)
  end
end
