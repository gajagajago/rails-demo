class Photo < ApplicationRecord
  belongs_to :article

  mount_uploader :photo_url, PhotoUploader
end
