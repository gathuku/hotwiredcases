module ApplicationHelper
  def markdown(example)
    content = File.read("app/views/#{example.namespace}/README.md")
    extensions = {
      fenced_code_blocks: true
    }
    renderer = Redcarpet::Render::HTML
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(content).html_safe
  end

  def example_image(example)
    asset = Rails.application.assets.find_asset("#{example.namespace}")
    return "e1.png" if asset.blank?

    "#{example.namespace}.png"
  end
end
