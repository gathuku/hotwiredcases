class UpdateExampleThreeSrcPath < ActiveRecord::Migration[7.0]
  def up
    Example.find_by!(namespace: "e3").update!(src_path: "/e3/products")
  end
end
