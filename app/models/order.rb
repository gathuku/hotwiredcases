class Order < ApplicationRecord
  has_many :items, class_name: "LineItem"

  accepts_nested_attributes_for :items, allow_destroy: true

  def number
    "#Order #{id}"
  end
end
