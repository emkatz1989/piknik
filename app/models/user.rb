class User < ActiveRecord::Base
   has_many :streams
   
   field :email, type: String
   field :password_digest, type: String
   
end
