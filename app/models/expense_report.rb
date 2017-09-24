class ExpenseReport < ApplicationRecord
  has_many :votes
  mount_uploader :image, ImageUploader
end
