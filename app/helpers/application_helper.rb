module ApplicationHelper
  def format_src_path(path)
    return if path.blank?

    if path.match?(/:product_id/)
      path.gsub(/:product_id/, Product.last.id.to_s)
    else
      path
    end
  end

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
