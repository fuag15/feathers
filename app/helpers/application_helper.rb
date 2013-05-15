# class for heling all views in the application
# helps determine what route is active as well as
# what class is appropriate in bootstrap for a rails flash
module ApplicationHelper
  # helper class to return the right bootstrap display class for rails flash types
  def bootstrap_class_for flash_type
    case flash_type
      when :alert
        'alert-block'
      when :notice
        'alert-info'
      else
        "alert-#{flash_type}"
    end
  end

  # Set up a helper to render red carpet markdown for some posting items
  # uses redcarpet2
  def markdown text
    markdown = Redcarpet::Markdown.new HTMLWithVideos, autolink: true, space_after_headers: true, no_intra_emphasis: true, superscript: true
    return markdown.render(text).html_safe
  end
end
