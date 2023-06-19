class Order < ApplicationRecord
  has_many :items, class_name: "LineItem"

  def number
    "#Order #{id}"
  end
end
