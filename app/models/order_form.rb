class OrderForm 
  
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  validates :token, presence: true
  validates :postal_code, presence: true, format: { 
    with: /\A[0-9]{3}-[0-9]{4}\z/, 
    message: "Input correctly" 
  }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "Select" }
  validates :city, presence: true
  validates :house_number, presence: true
  validates :phone_number, presence: true, format: { 
    with: /\A[0-9]+\z/, 
    message: "Input only number" 
  }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(
      postal_code: postal_code, 
      prefecture_id: prefecture_id, 
      city: city, 
      house_number: house_number, 
      building_name: building_name,
      phone_number: phone_number, 
      order_id: order.id
    )
  end
end