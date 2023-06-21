class Admin::BaseController < ApplicationController
  http_basic_authenticate_with(
    name: Rails.application.credentials.dig(:admin, :username),
    password: Rails.application.credentials.dig(:admin, :password)
  )
end
