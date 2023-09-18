class AddExampleSeven < ActiveRecord::Migration[7.0]
  def up
    Example.create!(
      name: "Turbo frame, nested attributes form",
      namespace: "e7",
      src_path: "/e7/orders/new"
    )
  end
end
