class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => ['picture']

  version :mobile do
    eager
    process :resize_to_fill => [600, 400, :north]
  end

  version :tablet do
    eager
    process :resize_to_fill => [450, 300, :north]
  end

  version :desktop do
    eager
    process :resize_to_fill => [300, 200, :north]
  end

  version :thumbnail do
    eager
    resize_to_fit(50, 50)
  end
end
