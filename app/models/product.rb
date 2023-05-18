class Product < ApplicationRecord
  validates :name, uniqueness: true

  scope :search, -> (query) do
    return if query.blank?

    where("name ILIKE ?", "%#{query}%")
  end
end
