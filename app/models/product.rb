class Product < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items
  
  validates :name, uniqueness: true
  validates :description, presence: true

  scope :search, -> (query) do
    return if query.blank?

    where("name LIKE ?", "%#{query}%")
  end
end
