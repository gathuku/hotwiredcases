class E4::ProductOrdersController < ExampleController
  def index
    product = Product.find(params[:product_id])
    @orders = product.orders
    sleep 3
  end
end
