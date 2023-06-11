class SubscriberMailer < ApplicationMailer
  def email_confirmation
    @subscriber = params[:subscriber]
    @signed_id = @subscriber.email_confirmation_tokens.create.signed_id(expires_in: 2.days)

    mail to: @subscriber.email, subject: "Confirm your subscription"
  end
end
