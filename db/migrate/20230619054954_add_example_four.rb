class AddExampleFour < ActiveRecord::Migration[7.0]
  def up
    Example.create!(
      name: "Lazy loading",
      namespace: "e4",
      src_path: "/e4/products"
    )
  end
end
