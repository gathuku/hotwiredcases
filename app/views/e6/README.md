[Turbo drive](https://turbo.hotwired.dev/handbook/drive) is part of Hotwire which enhances page navigation. It handles link and form submissions and updates the page without doing a full page reload. 

In this example, we look at how we can display form submission indicators by leveraging turbo-drive events.

When a form is submitted, Turbo Drive dispatches a series of [events](https://turbo.hotwired.dev/handbook/drive#form-submissions) that target the <form> element.


1. `turbo:submit-start`

2. `turbo:before-fetch-request`

3. `turbo:before-fetch-response`

4. `turbo:submit-end`

In this example, we are only interested in `turbo:submit-start` and `turbo:submit-end` events. In our form, we'll subscribe to these events and act when they are fired.

```
<%= form_with(
    model: product,
    url: product_path(product),
    data: {
      controller: :form,
      action: "turbo:submit-start->form#submitStart turbo:submit-end->form#submitEnd turbo:before-render@document->form#beforeRender"
    }

  ) do |form| %>
  <div>
    <%= form.label :available_on, class: "block" %>
    <%= form.date_field :created_at, oninput: "this.form.requestSubmit()" %>
  </div>
  <div class="mt-3">
    <%= form.label :price, class: "block" %>
    <%= form.number_field :price, oninput: "this.form.requestSubmit()" %>
  </div>
  <span data-form-target="hint" class="mt-3 text-green-400"></span>
<% end %>
```

In the stimulus controller when `submitStart` we display a `hint` text `Saving ...` and when `submitEnd` we display a text `Saved.`

```js
// form_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["hint"]

  submitStart(event) {
    this.hintTarget.textContent = "Saving ..."

    for (var element of event.target.elements) {
      element.setAttribute("disabled", "")
    }
  }

  submitEnd() {
    this.hintTarget.textContent = "Saved."
  }

  beforeRender(event) {
    event.preventDefault()
    setTimeout(() => { event.detail.resume() }, 1000)
  }
}
```

After the changes are saved we redirect back to the same page, `edit_product_path`

```rb
# products_controller.rb

  def update
    @product.update(product_params)

    redirect_to edit_product_path(@product)
  end
```

This redirect will not perform a full page reload and it's handled by Turbo Drive. We can be able to [Pause rendering](https://turbo.hotwired.dev/handbook/drive#pausing-rendering) and make some preparations before continuing. To do this we listen to `turbo:before-render` [Global event](https://stimulus.hotwired.dev/reference/actions#global-events) to be notified when rendering is about to start.
In this case, we pause rendering for 1 second to make sure the user can see a `Saved.` text before rendering happens and the text is cleared. 

```js
 // form_controller.js
 
  beforeRender(event) {
    event.preventDefault()
    setTimeout(() => { event.detail.resume() }, 1000)
  }
```
