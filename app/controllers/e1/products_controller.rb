class E1::ProductsController < ExampleController
  def show
    @product = Product.last
  end
end
