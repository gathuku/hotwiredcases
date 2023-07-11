Infinite scroll is a design approach which loads contents continuously as the user scrolls down. It eliminates the need of breaking content into multiple pages and pagination. Infinite scroll is well suited in cases where you want users to discover and explore the content available. An example of an infinite scroll is social media apps like Twitter, Facebook and Instagram.

In this example, we look at how to achieve infinite scroll using Hotwire.

```
<div>
  <%= turbo_frame_tag "products_#{@pagy.page}" do %>
    <%= render @products %>
    <% unless @pagy.page == @pagy.pages %>
      <%= turbo_frame_tag "products_#{@pagy.next}", src: e5_products_path(page: @pagy.next), loading: "lazy" do %>
        <div>Loading ...</div>
      <% end %>
    <% end %>
  <% end %>
</div>
```

The idea is to use nested frames, with the frame for the next pages nested inside the previous page frame. When the first page loads the [lazy loaded ](https://turbo.hotwired.dev/reference/frames#lazy-loaded-frame)frame for the next page is placed at the end. When it becomes visible, it's replaced with the content for the next page and lazy loaded for the third page renders at the end. This is possible because a link inside a turbo frame renders the frame content.

Note this example uses [pagy gem](https://github.com/ddnexus/pagy) but it's possible to use any other gem.

There's nothing much going on with the controller apart from a standard index method.

```
class ProductsController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @products = pagy_countless(Product.all, items: 10)
  end
end
```
