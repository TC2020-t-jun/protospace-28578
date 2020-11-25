class Comment < ApplicationRecord
  has_one_attached :prototype
  belongs_to :user
  belongs_to :prototype
  validates  :text,         presence: true
end
