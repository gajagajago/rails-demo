class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }

  before_save :downcase_fields

  has_many :article_categories
  has_many :articles, through: :article_categories

  def downcase_fields
    self.name.downcase!
  end
end
