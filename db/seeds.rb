
puts "Seeding..."

Example.create!([
  { name: "Inline Editing", namespace: "e1", src_path: "/e1/products/:product_id" },
  { name: "Modal", namespace: "e2", src_path: "/e2/products" },
  { name: "Typehead searching", namespace: "e3", src_path: "/e3/products" },
  { name: "Lazy loading", namespace: "e4", src_path: "/e4/products/:product_id" },
  { name: "Infinite scroll", namespace: "e5", src_path: "/e5/products" },
  { name: "Turbo drive - Form activity indicators", namespace: "e6", src_path: "/e6/products/:product_id/edit" },
  { name: "Turbo frame, nested attributes form", namespace: "e7", src_path: "/e7/orders/new" }
])


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

puts "Seeding done!"
