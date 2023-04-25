class HomeController < ApplicationController
  def index 
    @examples = Example.all
  end
end
