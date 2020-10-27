FactoryBot.define do
  factory :item do
    name                  {Faker::Lorem.characters(number: 40)}
    info                  {Faker::Lorem.characters(number: 1000)}
    price                 {1111}
    association           :category
    association           :sales_status
    association           :shipping_fee
    association           :prefecture
    association           :scheduled_delivery
    association           :user

    after(:build) do |item|
      item.image.attach(io: File.open("public/images/test_image.png"), filename: "test_image.png")
    end
  end
end
