class Comment < ApplicationRecord
  belongs_to :message, optional: true
  belongs_to :user
end
