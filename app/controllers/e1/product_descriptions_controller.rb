class E1::ProductDescriptionsController < ExampleController
  before_action :set_product

  def edit; end

  def update 
    @product.update!(product_params)

    redirect_to e1_product_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def product_params
    params.require(:product).permit(:description)
  end
end
