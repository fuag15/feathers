# simple class to also render videos with double emphasis
class HTMLWithVideos < Redcarpet::Render::HTML
  def double_emphasis text
    if Picture.where(name: text).present?
      "<a href='#{Picture.where(name: text).first.image.url}' class='lightbox'><img src='#{Picture.where(name: text).first.image.url}' /></a>"
    else
      nil
    end
  end
end