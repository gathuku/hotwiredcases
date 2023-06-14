class SubscriberConfirmationsController < ApplicationController
  before_action :set_subscriber, only: :show

  def show
    if @subscriber.present?
      @subscriber.confirm!
      redirect_to root_path, notice: "Thank you for verifying your email address"
    else
      redirect_to root_path, alert: "That email verification link is invalid"
    end
  end

  private

  def set_subscriber
    @subscriber = GlobalID::Locator.locate_signed(params[:subscriber_id])
  end
end
