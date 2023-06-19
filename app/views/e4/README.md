Lazy-loaded turbo frames are very useful when fetching data asynchronously from the server.

The idea with a Lazy-loaded frame, content is loaded from `src` when the frame becomes visible. The loaded content replaces the existing content.

```
<turbo-frame id="orders" src="/orders" loading="lazy">
  Content will be replaced when the frame becomes visible and /order has been loaded.
</turbo-frame>
```

In our example, we first make our frame visible with a `skeleton UI` which is used to indicate loading status. 

```
# products/show.html.erb

<div>
  <h3 class="text-xl font-bold"><%= @product.name %> orders</h3>
  <div class="mt-5">
    <%= turbo_frame_tag :orders, src: product_orders_path(@product), loading: :lazy do %>
      <%= render "skeleton" %>
    <% end %>
  </div>
</div>
```

```
# products/skeleton.html.erb
<div class="space-y-3">
  <% 10.times do %>
    <div class="p-3 bg-gray-100 rounded-md shadow-sm animate-pulse">
      <div class="w-24 h-3 bg-gray-500 rounded"></div>
      <div class="w-64 h-3 mt-3 bg-gray-500 rounded"></div>
    </div>
  <% end %>
</div>
```

When the frame becomes visible turbo will request the `src` path. The response to the request must match the frame id.

```
# product_orders/index.html.erb

<%= turbo_frame_tag :orders do %>
  <div class="space-y-3">
    <%= render partial: "product_orders/order", collection: @orders %>
  </div>
<% end %>
```

The product_order index page is rendered as the response which replaces the frame `order` content hence the product list appears.
