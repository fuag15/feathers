# simple class to also render videos with double emphasis
class HTMLWithVideos < Redcarpet::Render::HTML
  def double_emphasis text
    "<div class='embeded-vimeo'>#{Video.where(name: text).first.iframe}</div>"
  end
end