class User < ActiveRecord::Base
	has_attached_file :stream, styles: {
    	thumb: '100x100>',
    	square: '200x200#',
    	medium: '300x300>'
  	}
  	# Validate the attached image is image/jpg, image/png, etc
  	validates_attachment_content_type :stream, :content_type => /\Aimage\/.*\Z/


   has_many :streams
   
   field :email, type: String
   field :password_digest, type: String
   
end
