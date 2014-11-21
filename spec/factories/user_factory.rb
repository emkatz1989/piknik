#NOTE: Factory Girl Expects that each class inherits from ActiveRecord

#All of our factory declarations get wrapped in a FactoryGirl.define block

FactoryGirl.define do
	factory :a_user, class: User do

		email ""
		password ""
end	
end