class CreateSubscriberMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriber_messages do |t|
      t.text :content

      t.timestamps
    end
  end
end
