class Post < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  has_one_attached :image

  validates :description, presence: true
  validates :image_title, presence: true
  validates :user_id, presence: true

end
