class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :email, presence: true, uniqueness: true, email: true # email_validator
  validates :password, presence: true

  has_secure_password

  before_save { self.email = email.downcase }
  # before_save { self.password = encrypt_password(password) }

  has_many :articles

  # def encrypt_password(password)
  #   BCrypt::Password.create(password)
  # end
end
