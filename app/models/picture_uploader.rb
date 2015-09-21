class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => ['post_picture']

  version :standard do
    eager
    process :resize_to_fill => [400, 400, :north]
  end

  version :small do
    eager
    process :resize_to_fill => [200, 200, :north]
  end

  version :thumbnail do
    eager
    resize_to_fit(50, 50)
  end
end
