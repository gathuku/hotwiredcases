class E8::OrdersController < ApplicationController
  layout 'example'

  def index 
    @time = Time.now.to_i
  end

  def show 
    @time = Time.now.to_i
  end
end
