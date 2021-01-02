class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 20 }
  validates :description, presence: true, length: { minimum: 5 }

  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :comments, dependent: :destroy
end