class AddExampleFive < ActiveRecord::Migration[7.0]
  def up
    Example.create!(
      name: "Infinite scroll",
      namespace: "e5",
      src_path: "/e5/products"
    )
  end
end
