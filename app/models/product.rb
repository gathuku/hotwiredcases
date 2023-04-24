class Product < ApplicationRecord
  validates :name, uniqueness: true
end
