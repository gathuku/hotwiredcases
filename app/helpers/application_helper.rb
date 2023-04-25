module ApplicationHelper
  def markdown
    content = File.read("app/views/e1/README.md")
    extensions = {
      fenced_code_blocks: true
    }
    renderer = Redcarpet::Render::HTML
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(content).html_safe
  end
end
