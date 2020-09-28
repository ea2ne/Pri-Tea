class Message < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments
  mount_uploader :image, ImageUploader

  def self.search(search)
    if search != ""
      Message.where('text LIKE(?)', "%#{search}%")
    else
      Message.all
    end
  end
end
  