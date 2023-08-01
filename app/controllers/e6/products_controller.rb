class E6::ProductsController < ExampleController
  before_action :set_product

  def edit
  end

  def update
    sleep 0.5
    @product.update(product_params)

    redirect_to edit_e6_product_path(@product)
  end

  private

  def product_params
    params.require(:product).permit(:price, :created_at)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
