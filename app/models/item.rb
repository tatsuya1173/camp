class Item < ApplicationRecord
    belongs_to :post
    has_one_attached :item_image

    validates :brand, presence: true
    validates :size, presence: true
    validates :price, presence: true
    validates :products_name, presence: true
    validates :post_id, presence: true
end
