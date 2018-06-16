# frozen_string_literal: true

module MarkdownHelper
  require 'redcarpet/render_strip'
  def markdown(text, type: '')
    return unless text.present?
    content_tag(:div, class: "markdown #{type}") do
      sanitize(markdown_renderer.render(text))
    end
  end

  def sanitize(input)
    ActionView::Base.new.sanitize(input.html_safe)
  end

  def markdown_renderer
    renderer = Redcarpet::Render::HTML.new(link_attributes: { target: :blank })
    Redcarpet::Markdown.new(renderer,
                            no_intra_emphasis: true,
                            fenced_code_blocks: true,
                            autolink: true,
                            tables: true,
                            underline: true,
                            highlight: true)
  end
end
