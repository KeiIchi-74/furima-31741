items = []
10.times do |i|
  item = Item.create(
    name: "サンプル#{i + 1}",
    info: "サンプル#{i + 1}",
    category_id: 3,
    sales_status_id: 2,
    shipping_fee_id: 2,
    prefecture_id: 2,
    scheduled_delivery_id: 2,
    price: 450,
    user_id: 1
    )
  
  items << item
  item = Item.create(
    name: "サンプル#{i + 1}",
    info: "サンプル#{i + 1}",
    category_id: 4,
    sales_status_id: 2,
    shipping_fee_id: 2,
    prefecture_id: 2,
    scheduled_delivery_id: 2,
    price: 450,
    user_id: 1
    )
  
  items << item
  item = Item.create(
    name: "サンプル#{i + 1}",
    info: "サンプル#{i + 1}",
    category_id: 5,
    sales_status_id: 2,
    shipping_fee_id: 2,
    prefecture_id: 2,
    scheduled_delivery_id: 2,
    price: 450,
    user_id: 1
    )
  
  items << item
  item = Item.create(
    name: "サンプル#{i + 1}",
    info: "サンプル#{i + 1}",
    category_id: 6,
    sales_status_id: 2,
    shipping_fee_id: 2,
    prefecture_id: 2,
    scheduled_delivery_id: 2,
    price: 450,
    user_id: 1
    )
  
  items << item
  item = Item.create(
    name: "サンプル#{i + 1}",
    info: "サンプル#{i + 1}",
    category_id: 7,
    sales_status_id: 2,
    shipping_fee_id: 2,
    prefecture_id: 2,
    scheduled_delivery_id: 2,
    price: 450,
    user_id: 1
    )
  
  items << item
  item = Item.create(
    name: "サンプル#{i + 1}",
    info: "サンプル#{i + 1}",
    category_id: 8,
    sales_status_id: 2,
    shipping_fee_id: 2,
    prefecture_id: 2,
    scheduled_delivery_id: 2,
    price: 450,
    user_id: 1
    )
  
  items << item
  item = Item.create(
    name: "サンプル#{i + 1}",
    info: "サンプル#{i + 1}",
    category_id: 9,
    sales_status_id: 2,
    shipping_fee_id: 2,
    prefecture_id: 2,
    scheduled_delivery_id: 2,
    price: 450,
    user_id: 1
    )
  
  items << item
  item = Item.create(
    name: "サンプル#{i + 1}",
    info: "サンプル#{i + 1}",
    category_id: 10,
    sales_status_id: 2,
    shipping_fee_id: 2,
    prefecture_id: 2,
    scheduled_delivery_id: 2,
    price: 450,
    user_id: 1
    )
  
  items << item
  item = Item.create(
    name: "サンプル#{i + 1}",
    info: "サンプル#{i + 1}",
    category_id: 11,
    sales_status_id: 2,
    shipping_fee_id: 2,
    prefecture_id: 2,
    scheduled_delivery_id: 2,
    price: 450,
    user_id: 1
    )
  
  items << item
end

Item.import items


