class AddOrderData < ActiveRecord::Migration[7.0]
  def up
    100.times do
      Product.create(
        {
          name: Faker::Commerce.product_name,
          price: Faker::Commerce.price,
          description: Faker::Lorem.paragraph(sentence_count: 10)
        }
      )
    end

    50.times do
      order = Order.new
      order.items << LineItem.new(order: order, product: Product.last)
      order.save!
    end

    Product.last.update!(description: Faker::Lorem.paragraph(sentence_count: 10))
  end
end
