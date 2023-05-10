
In this example we demostrate how you can achive a modal using hotwire. 

The idea is to replace a turbo frame with modal content. The turbo frame need to be acessible by all yielded content so we can place it at the layout before closing the `</body>`

```erb
# app/views/layouts/application.html.erb

<!DOCTYPE html>
<html>
  <head>
  </head>
  <body>
    <main>
      <%= yield %>
    </main>
    <%= turbo_frame_tag :modal %>
  </body>
</html>
```

Now whenever we want to display the modal, we target this frame with the request.

```erb
  <%= link_to "Open modal", new_product_path, data: { turbo_frame: :modal }  %>

```

This request will replace `modal` frame with content from it's response. The response it wrapped on a frame matching the id of the frame to replace `modal`

```
# app/products/new.html.erb

<%= turbo_frame_tag :modal do %>
  <div class="fixed inset-0 z-50 p-2" role="dialog" aria-modal="true">
    <div class="fixed inset-0 transition-opacity bg-gray-400 bg-opacity-75" aria-hidden="true"></div>
    <div class="relative flex items-center justify-center h-full">
      <div class="w-full max-w-sm max-h-screen px-5 py-3 overflow-auto bg-white rounded-lg md:max-w-lg">
        <%# modal content %>
      </div>
    </div>
  </div>
<% end %>
```

A simple solution to close this modal is to link back to `products_path` using `data-turb-frame="_top"`. Later in this example we will look how can close the modal using stimulus when you click outside the modal

```
<%= link_to "Close", products_path, data: { turbo_frame: "_top" } %>
```
