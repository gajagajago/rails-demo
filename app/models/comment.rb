class Comment < ApplicationRecord
  validates :comment, presence: true

  belongs_to :user
  belongs_to :article, optional: true
  belongs_to :commentable, class_name: "Comment", optional: true

  has_many :replies, class_name: "Comment", foreign_key: "commentable_id", dependent: :destroy
end
