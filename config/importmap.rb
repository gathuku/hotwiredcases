# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js" # @8.0.12
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "trix" # @2.1.12
pin "@rails/actiontext", to: "@rails--actiontext.js" # @8.0.100
pin "@hotwired/turbo", to: "@hotwired--turbo.js" # @8.0.12
pin "@rails/actioncable/src", to: "@rails--actioncable--src.js" # @7.2.201
