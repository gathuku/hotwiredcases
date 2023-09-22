class E7::OrdersController < ExampleController
  def new
    @order = Order.new(order_params)
    @order.items.build if @order.items.blank?
  end

  private

  def order_params
    params.fetch(:order, {}).permit(items_attributes: [:product_id, :quantity, :_destroy])
  end
end
