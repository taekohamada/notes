class Post < ApplicationRecord

  belongs_to :note
  belongs_to :user

  mount_uploader :image, ImageUploader

end
