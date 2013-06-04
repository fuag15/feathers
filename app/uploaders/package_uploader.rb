# holds packages which are zip files of projects not available on github
class PackageUploader < CarrierWave::Uploader::Base
  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{@model.class.to_s.underscore}/#{mounted_as}/#{@model.id}"
  end

  # A white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(zip)
  end
end
