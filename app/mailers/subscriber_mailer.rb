class SubscriberMailer < ApplicationMailer
  def email_confirmation
    @subscriber = params[:subscriber]
    @signed_id = @subscriber.to_sgid(expires_in: 2.days)

    mail to: @subscriber.email, subject: "Hotwiredcases: confirm your subscription"
  end

  def new_message
    subscriber = params[:subscriber]
    @message = params[:message]
    mail(to: subscriber.email, subject: "This week Hotwired case")
  end
end
