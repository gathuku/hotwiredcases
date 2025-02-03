In modern applications, realtime data streaming is crucial to end users. In this example, we explore how to use Turbo to show realtime updates to users.

In Turbo, the `FrameElement.reload()` function reloads the frame element from its `src`.

In this example, we have a simple frame that renders the number of seconds since the Epoch.

```rb
<%= turbo_frame_tag :orders, src: order_path(1), loading: :lazy, data: {controller: :frame } do %>
  <%= Time.current.to_i %>
<% end %>
```

With this Turbo frame, we can hook in a simple [Stimulus](https://stimulus.hotwired.dev/) controller that will reload this frame after a set interval. 



```js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    reloadInterval: 1000
  }

  connect() {
    setInterval(() => { this.element.reload() }, this.reloadIntervalValue)
  }
}
```

This will reload the frame the frame src response in this case `order_path(1)` which return the epoch time

```rb
<%= turbo_frame_tag :orders  do %>
  <%= @time %>
<% end %>
```
