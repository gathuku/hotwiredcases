This example demostrate how you can achive inline editing with hotwire. 

The description text is inside a turbo frame `<turbo_frame id="product_description"><turbo_frame>`. 


```rb
<div class="max-w-xl mx-auto">
  <div class="flex justify-between text-xl font-medium text-gray-900">
    <span><%= @product.name %></span>
    <span><%= @product.price %></span>
  </div>
  <div class="mt-5">
    <span class="text-gray-900 font-base">Description</span>
    <span class="block mt-2 text-gray-500">
      <%= turbo_frame_tag :product_description do %>
        <%= link_to edit_e1_product_description_path(@product) do %>
          <%= @product.description || 'No description' %>
        <% end %>
      <% end %>
    </span>
  </div>
</div>
```

When you click the link the server response with another frame with the same id which replaces the content.


```rb
<%= turbo_frame_tag :product_description do %>
  <%= form_with(model: @product, url: e1_product_description_path(@product), data: { turbo_frame: "_top"}) do |form |%>
    <%= form.text_area :description, onfocusout: "this.form.requestSubmit()", class: "w-full border-gray-300 rounded-lg" %>
  <% end %>
<% end %>
```

The content of this frame is a form that has a text area which allow us to edit the content. 
The text area field submit the form on focus out event. 
