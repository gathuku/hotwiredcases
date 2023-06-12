# Preview all emails at http://localhost:3000/rails/mailers/subscriber_mailer
class SubscriberMailerPreview < ActionMailer::Preview
  def email_confirmation
    subscriber = Subscriber.first
    SubscriberMailer.with(subscriber:).email_confirmation
  end
end
