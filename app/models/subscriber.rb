class Subscriber < ApplicationRecord
  has_many :email_confirmation_tokens, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def confirm!
    update!(confirmed_at: Time.current)
  end

  def confirmed? = confirmed_at.present?
end
