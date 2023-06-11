class CreateEmailConfirmationTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :email_confirmation_tokens do |t|
      t.references :subscriber, null: false, foreign_key: true
    end
  end
end
