class Pic < ActiveRecord::Base

	has_attached_file :image, styles: {
		thumb: '64x64>',
		medium: '300x300>'
	}, 
	:path => ":attachment/:id/:style/:filename"

 # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end