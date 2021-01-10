class Message < ApplicationRecord
  validates :message, presence: true, length: { minimum: 1 }

  belongs_to :user
  belongs_to :chatroom
end
