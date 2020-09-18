class Message < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  mount_uploader :image, ImageUploader
end
