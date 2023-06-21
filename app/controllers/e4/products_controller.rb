class E4::ProductsController < ExampleController
  def show
    @product = Product.find(params[:id])
  end
end
