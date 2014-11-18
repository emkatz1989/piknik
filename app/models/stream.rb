class Stream < ActiveRecord::Base
   field :name, type: String
   field :description, type: String
   # field :stream, type: Binary

   belongs_to :user
end
