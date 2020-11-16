items = []
250.times do |i|
  item = Item.create(
    name: "サンプル#{i + 1}",
    info: "サンプル#{i + 1}",
    category_id: 2,
    sales_status_id: 2,
    shipping_fee_id: 2,
    prefecture_id: 2,
    scheduled_delivery_id: 2,
    price: 450,
    user_id: 3
    )
  
  items << item
end

Item.import items


