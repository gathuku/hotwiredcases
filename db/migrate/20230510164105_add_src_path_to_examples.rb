class AddSrcPathToExamples < ActiveRecord::Migration[7.0]
  def change
    add_column :examples, :src_path, :string

    up_only do
      Example.find_by(namespace: "e1").update!(src_path: "/e1/products/:product_id")
      Example.find_by(namespace: "e2").update!(src_path: "/e2/products")
    end
  end
end
