class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates_presence_of :title

  # validates_presence_of :image, allow_nil: true
  # validates_presence_of :remote_image_url, allow_nil: true

  # validate :image_xor_remote_image_url

  # private
  # def image_xor_remote_image_url
  #   if !(:image.blank? ^ :remote_image_url.blank?)
  #     errors.add(:base, "Please select an image for upload")
  #   end
  # end


def check_type?(data_type)
  type = data_type.split('/')
  if type[0] != 'image'
    return false
  else
    return true
  end
end

end
