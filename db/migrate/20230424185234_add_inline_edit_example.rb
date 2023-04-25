class AddInlineEditExample < ActiveRecord::Migration[7.0]
  def up
    Example.create!([
      {name: "Inline Editing", namespace: "e1"},
      {name: "Modal", namespace: "e2" },
      {name: "Typehead searching", namespace: "e3"}
    ])
  end
end
