# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  # include CarrierWave::RMagick # アップロード時にstack level too deepエラーがでるのでMiniMagickにした
  include CarrierWave::MiniMagick
  storage :file
  permissions 0666
  directory_permissions 0777
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  version :thumb do
    process :resize_to_fill => [200,200]
  end
end
