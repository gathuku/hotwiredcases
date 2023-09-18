
Active record nested attributes allow us to build nested forms. In most cases, you may need a way to populate your relation for `accepts_nested_attributes_for` on the fly. In this example, we look at how we can add items on the fly using turbo.


The main idea is to handle form [submission implictly](https://html.spec.whatwg.org/multipage/form-control-infrastructure.html#implicit-submission). In our form we add an extra submit button.


```
<%= form_with(model: [:e7, order]) do |form| %>
  <% form.object.items.each_with_index do |item, index| %>
    <%= form.fields :items_attributes, model: item, index: index do |f| %>
      <fieldset>
        <%= f.collection_select :product_id, Product.all, :id, :name, {}, class: "" %>

        <%= f.text_field :quantity %>

        <%= f.button :_destroy, value: true, formaction: new_e7_order_path,  formmethod: "get" do %>
          Remove
        <% end %>
      </fieldset>
    <% end %>
  <% end %>
  <%= form.fields :items_attributes, index: form.object.items.size do |f| %>
    <%= f.button :_destroy, value: false, formaction: new_e7_order_path,  formmethod: "get" do %>
      Add item
    <% end %>
  <% end %>
  <%= form.submit  %>
<% end %>


```

In this button `Add item` we override submission by using [formaction](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#formaction). By default, a form is a `POST` HTTP method but again we also override this with [formmethod](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button#formmethod)
When we click `Add new` a get request is made to `new_order_path`. The button has a name `_detroy` and value `value`, this adds an extra key in the params hash which will build a new item that gets added to our list, The cycle continues as new items get added.

```
{
  "authenticity_token"=>"[FILTERED]",
  "order"=>{
    "items_attributes"=>{
      "0"=>{
        "product_id"=>"397",
        "quantity"=>"1"
      },
      "1"=>{
        "_destroy"=>"false"
      }
    }
  }
}
```

To remove an item we use a similar button but for this case destroy value will be true. This will add a `destroy: true` attribute to the `removed` item, rails will handle this and remove this item from the relationship.

```
<%= f.button :_destroy, value: true, formaction: new_e7_order_path,  formmethod: "get" do %>
    Remove
  <% end %>
```

The controller is very simple as we only initialize a new `Order` with the permitted parameters. On page load the items will be blank that's why we are adding at least one item if items are blank.

```
class OrdersController < ExampleController
  def new
    @order = Order.new(order_params)
    @order.items.build if @order.items.blank?
  end

  private

  def order_params
    params.fetch(:order, {}).permit(items_attributes: [:product_id, :quantity, :_destroy])
  end
end

``

To take advantage of turbo we wrap item attributes and `Add new` button inside a `<turbo_frame>` and target it with `Add new` and `Remove` get request, this way only that part of the page is reloaded.
