class Stream < ActiveRecord::Base

   belongs_to :user
   has_many :images

   
   validates_presence_of :name
   # validates_presence_of :description
   # validates_presence_of :image

  	

end
