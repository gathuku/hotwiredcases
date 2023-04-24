class E1::ProductsController < ApplicationController
  layout "example"
  
  def show
    @product = Product.last
  end
end
