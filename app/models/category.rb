class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }

  before_save :downcase_fields

  def downcase_fields
    self.name.downcase!
  end
end
