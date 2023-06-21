class Subscriber < ApplicationRecord
  has_many :email_confirmation_tokens, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }


  def self.send_message(message)
    find_each do |subscriber|
      SubscriberMailer.with(subscriber: subscriber, message: message).new_message.deliver_later
    end
  end


  def confirm!
    update!(confirmed_at: Time.current)
  end

  def confirmed? = confirmed_at.present?
end
