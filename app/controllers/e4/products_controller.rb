class E4::ProductsController < ApplicationController
  def show
    @product = Product.find(params[:product_id])
  end
end
