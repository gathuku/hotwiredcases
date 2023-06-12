class SubscribersController < ApplicationController
  def create
    subscriber = Subscriber.new(subscriber_params)

    if subscriber.save
      SubscriberMailer.with(subscriber:).email_confirmation.deliver_later
      render turbo_stream: turbo_stream.replace("subscribe", partial: "home/subscribe_success")
    else
      render turbo_stream: turbo_stream.replace("subscribe", partial: "home/subscribe", locals: { subscriber: subscriber})
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
