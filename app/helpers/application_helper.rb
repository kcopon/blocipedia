module ApplicationHelper

def markdown_to_html(markdown)
  renderer = Redcarpet::Render::HTML.new
  extensions = {fenced_code_blocks: true, hard_wrap: true, filter_html: true, autolink: true, no_intraemphasis: true, gh_blockd: true}
  redcarpet = Redcarpet::Markdown.new(renderer, extensions)
  (redcarpet.render markdown).html_safe
end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end    
end

