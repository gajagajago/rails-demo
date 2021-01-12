class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :description, presence: true, length: { minimum: 5 }

  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :comments, dependent: :destroy
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos
end