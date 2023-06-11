class AddConfirmedAtToSubscribers < ActiveRecord::Migration[7.0]
  def change
    add_column :subscribers, :confirmed_at, :datetime
  end
end
