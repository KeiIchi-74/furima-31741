class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  has_many :reports, dependent: :destroy
  has_many :users, through: :reports
  
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :info, presence: true, length: { maximum: 1000 }
  with_options numericality: { other_than: 1, message: "Select" } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end
  validates :price, presence: true, 
  format: { 
    with: /\A\d+\z/, 
    message: "Half-width number" 
  }, 
  numericality: { 
    greater_than_or_equal_to: 300, 
    message: "Out of setting range", 
    less_than_or_equal_to: 9999999, 
    message: "Out of setting range" 
  }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def reported_by?(user)
    reports.where(user_id: user.id).exists?
  end
  
end
