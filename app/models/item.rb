class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :sales_status, :shipping_fee, :prefecture, :scheduled_delivery
  has_one_attached :image
end
