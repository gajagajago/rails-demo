class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :email, presence: true, uniqueness: true, email: true # email_validator

  before_save { self.email = email.downcase }

  has_many :articles
end
