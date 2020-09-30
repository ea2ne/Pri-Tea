class Message < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader
  mount_uploader :pic, ImageUploader

  def self.search(search)
    if search != ""
      Message.where('keyword LIKE(?)', "%#{search}%")
    else
      Message.all
    end
  end
end
  