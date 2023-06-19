class Order < ApplicationRecord
  has_many :items, class_name: "LineItem"
end
