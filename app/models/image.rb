class Image < ActiveRecord::Base
	belongs_to :stream
	belongs_to :user

	has_attached_file :image, styles: {
    	thumb: '100x100>',
    	square: '200x200#',
    	medium: '300x300>'
  	}
  	# Validate the attached image is image/jpg, image/png, etc
  	validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]


    validates_presence_of_attached_file

end
