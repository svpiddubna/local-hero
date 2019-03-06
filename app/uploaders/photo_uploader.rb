class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :bright_face do
    cloudinary_transformation effect: "brightness:10", radius: 20,
      width: 150, height: 150, crop: :thumb, gravity: :face
  end
end
