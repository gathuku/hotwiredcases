class HomeController < ApplicationController
  def index 
    @examples = Example.order(:created_at)
  end
end
