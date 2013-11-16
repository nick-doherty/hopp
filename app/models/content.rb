class Content < ActiveRecord::Base
	attr_accessible :url, :duration, :interest_id
	has_and_belongs_to_many :interests
end