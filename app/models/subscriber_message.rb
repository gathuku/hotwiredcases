class SubscriberMessage < ApplicationRecord
  has_rich_text :content
  
  validates :content, presence: true
end
