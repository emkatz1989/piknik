require "rails_helper"

require 'shoulda/matchers'

describe User do 
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }

	

	it do 
		should allow_value('a@a.com').
		             for (:email)
    end

    it do
    	should !allow_value('bob').
    		for(:email)
    end

    it { should have_many(:streams) }

	
end