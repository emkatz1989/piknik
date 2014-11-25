require "rails_helper"

require 'shoulda/matchers'

describe User do 
	it { should validate_presence_of(:email) }

	it do 
		should allow_value('a@a.com').
		             for (:email)
    end

    it do
    	should !allow_value('bob').
    		for(:email)
    end

    it { should have_many(:streams) }

	# it { should ensure_length_of(:email).is_at_least(6) }

	# it { should validate_presence_of(:password).is_at_most(20) }

	# it { should ensure_length_of(:email).is_at_most(255)}
	
end