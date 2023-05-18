class E3::ProductsController < ExampleController
  def index
    @products = Product.search(params[:query]).limit(50)
  end
end
