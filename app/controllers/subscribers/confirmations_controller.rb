class Subscribers::ConfirmationsController < ApplicationController
  before_action :set_subscriber, only: :show

  def show
    @subscriber.confirm!
    redirect_to root_path, notice: "Thank you for verifying your email address"
  end

  private

  def set_subscriber
    token = EmailConfirmationToken.find_signed!(params[:sid]); @subscriber = token.subscriber
  rescue StandardError
    redirect_to root_path, alert: "That email verification link is invalid"
  end
end
