class E5::ProductsController < ApplicationController
  layout 'example'
  include Pagy::Backend

  def index
    sleep 0.5
    @pagy, @products = pagy_countless(Product.all, items: 5)
  end
end
