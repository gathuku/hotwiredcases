class AddExampleFour < ActiveRecord::Migration[7.0]
  def up
    example = Example.new(
      name: "Lazy loading",
      namespace: "e4",
      src_path: "/e4/products"
    )
    example.save!
  end
end
