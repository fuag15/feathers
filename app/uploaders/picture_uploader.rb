# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fit: [100, 100]
  end

  version :small do
    process resize_to_fit: [150, 150]
  end

  version :medium do
    process resize_to_fit: [300, 300]
  end

  version :large do
    process resize_to_fit: [400, 400]
  end

  version :bestfit do
    process resize_to_fit: [813, 813]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end