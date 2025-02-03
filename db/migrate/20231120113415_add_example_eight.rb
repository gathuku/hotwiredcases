class AddExampleEight < ActiveRecord::Migration[7.0]
  def up
    Example.create!(
      name: "Turbo frame - Reload",
      namespace: "e8",
      src_path: "/e8/orders"
    )
  end
end
