require "rails_helper"
require 'shoulda/matchers'

describe Stream do

	it { should validate_presence_of(:name) }

	# it { should validate_presence_of(:description) }

	# it { should validate_presence_of(:image) }

	it { should validate_attachment_content_type (:image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif")}
}

	it { should belong_to(:user) }
	
end