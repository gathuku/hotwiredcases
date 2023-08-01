class AddExampleSix < ActiveRecord::Migration[7.0]
  def up
    Example.create!(
      name: "Turbo drive - Form activity indicators",
      namespace: "e6",
      src_path: "/e6/products/:product_id/edit"
    )
  end
end
