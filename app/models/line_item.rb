class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order


  attribute :quantity, default: 1
end
