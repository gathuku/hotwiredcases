In every application, the ability to search a huge set of data is a must. In this example, we look at how you can achieve this with Hotwire in Rails.

The layout will contain two main sections, a form with a search form and a frame that holds search results. 

```
<div>
  <div>
    <%= form_with(url: e3_products_path, method: :get, data: { turbo_frame: :products })  do |form| %>
      <%= form.text_field :query, placeholder: "Search product by name", oninput: "this.form.requestSubmit()", class: "w-full" %>
    <% end %>
  </div>
  <%= turbo_frame_tag :products do %>
    <div class="mt-3 space-y-3 divide-y">
      <%= render partial: "product", collection: @products %>
    </div>
  <% end %>
</div>
```

We listen to search field [input event](https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/input_event) and submit the form with [this.form.requestSubmit()](https://developer.mozilla.org/en-US/docs/Web/API/HTMLFormElement/requestSubmit). The form method is `get` and it's submitted to the path `products_path`. Notice `data: {turbo_frame: :products}` which specifies the frame to replace with the response.

```
class ProductsController < ApplicationController
  def index
    @products = Product.search(params[:query])
  end
end
```

The controller action queries the data using a simple search [scope](https://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html#method-i-scope)

```
class Product < ApplicationRecord
  scope :search, -> (query) do
    return if query.blank?

    where("name ILIKE ?", "%#{query}%")
  end
end
```

You can implement [PgSearch](https://github.com/Casecommons/pg_search) for advanced searching.
