class Message < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :group

  mount_uploader :image, ImageUploader
end
