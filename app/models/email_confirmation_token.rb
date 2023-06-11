class EmailConfirmationToken < ApplicationRecord
  belongs_to :subscriber
end
