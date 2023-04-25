This example demonstrates how you can achieve inline editing using Hotwire. 

The description text is inside a turbo frame `<turbo_frame id="product_description"><turbo_frame>` and a link to `edit_product_description_path`. 

```rb
# app/views/products/show.html.erb

<div>
  <div class="flex justify-between text-xl font-medium text-gray-900">
    <span><%= @product.name %></span>
    <span><%= @product.price %></span>
  </div>
  <div class="mt-5">
    <span class="text-gray-900 font-base">Description</span>
    <span class="block mt-2 text-gray-500">
      <%= turbo_frame_tag :product_description do %>
        <%= link_to edit_product_description_path(@product) do %>
          <%= @product.description || 'No description' %>
        <% end %>
      <% end %>
    </span>
  </div>
</div>
```
 When a user clicks the link the request goes through the controller `edit` action which renders `app/product_descriptions/edit.html.erb` and returns it as HTML response.

```rb
# app/product_descriptions/edit.html.erb

<%= turbo_frame_tag :product_description do %>
  <%= form_with(model: @product, url: product_description_path(@product), data: { turbo_frame: "_top"}) do |form |%>
    <%= form.text_area :description, onfocusout: "this.form.requestSubmit()", class: "w-full border-gray-300 rounded-lg" %>
  <% end %>
<% end %>
```

The response is wrapped with a frame with a matching id of the request container. This will replace the frame with new content which is a form with a text area to edit the description. 

The text area field submits the form on focus out event to `product_description_path(@product)`. This goes to the controller `update` action that updates the product record and redirects back to the product show page.


```rb
# app/controllers/product_descriptions_controller.rb

class ProductDescriptionsController < ApplicationController
  def edit; end

  def update 
    @product.update!(product_params)

    redirect_to product_path(@product)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def product_params
    params.require(:product).permit(:description)
  end
end
```
