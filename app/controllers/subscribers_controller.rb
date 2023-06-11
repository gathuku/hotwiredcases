class SubscribersController < ApplicationController
  before_action :set_subscriber, only: :show

  def show
    @subscriber.confirm!
    redirect_to root_path, notice: "Thank you for verifying your email address"
  end

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

  def set_subscriber
    token = EmailConfirmationToken.find_signed!(params[:sid]); @subscriber = Subscriber.find(params[:id])
  rescue StandardError
    redirect_to root_path, alert: "That email verification link is invalid"
  end
end
