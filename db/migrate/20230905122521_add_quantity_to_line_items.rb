class AddQuantityToLineItems < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :quantity, :integer, default: 0
  end
end
