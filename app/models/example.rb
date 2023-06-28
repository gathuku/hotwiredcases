class Example < ApplicationRecord
  def to_param
    "#{id}-#{name.parameterize}"
  end
end
