class E1::ProductDescriptionsController < ExampleController
  before_action :set_product

  def edit; end

  def update 
    @product.assign_attributes(product_params)
    if @product.valid?
      @product.save
      redirect_to e1_product_path(@product)
    else
      render turbo_stream: turbo_stream.update(
        :product_description, 
         partial: 'e1/product_descriptions/form', 
         locals: {product: @product} 
        )
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
  

  def product_params
    params.require(:product).permit(:description)
  end
  
end
