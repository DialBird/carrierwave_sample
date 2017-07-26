class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  if Rails.env.development?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fill: [200, 200]
  process convert: 'jpg'

  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  def filename
    super.chomp(File.extname(super)) + ".jpg" if original_filename
  end
end
