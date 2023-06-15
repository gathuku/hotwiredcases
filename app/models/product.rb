class Product < ApplicationRecord
  validates :name, uniqueness: true
  validates :description, presence: true

  scope :search, -> (query) do
    return if query.blank?

    where("name ILIKE ?", "%#{query}%")
  end
end
