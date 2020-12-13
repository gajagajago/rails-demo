class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :email, presence: true, uniqueness: true, email: true # email_validator
  validates :password, presence: true

  has_secure_password

  before_save { self.email = email.downcase }

  has_many :articles, dependent: :destroy
end