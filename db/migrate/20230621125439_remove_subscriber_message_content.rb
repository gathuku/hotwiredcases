class RemoveSubscriberMessageContent < ActiveRecord::Migration[7.0]
  def up
    remove_column :subscriber_messages, :content
  end
end
