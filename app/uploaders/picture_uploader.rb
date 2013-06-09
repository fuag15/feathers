# Uploader to handle images associated with Post Project and Job
class PictureUploader < CarrierWave::Uploader::Base
  # include sprokets helpers for rails 3.1+ asset pipeline compatability
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper
  # rmagick for image manipulation
  include CarrierWave::MiniMagick
  # store in files
  storage :file

  # default storage dir for uploaded files
  def store_dir
    "uploads/#{@model.class.to_s.underscore}/#{mounted_as}/#{@model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    asset_path "waterdrop.png"
  end

  # image size used in Post image list
  version :thumb do
    process resize_to_fit: [100, 100]
  end

  # image size used in Job and Project sub list
  version :small do
    process resize_to_fit: [150, 150]
  end

  # image size used in Project and Job index displays
  version :gallery do
    process resize_to_fit: [160, 180]
  end

  # image size used for lightbox displays
  version :large do
    process resize_to_fit: [400, -1]
  end

  # image size used for largest deisplay in Project and Job show routes
  version :bestfit do
    process resize_to_fit: [813, -1]
  end

  # allowed extension types
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end