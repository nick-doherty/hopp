# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Bookmark < ActiveRecord::Base
	attr_accessible :url, :user_id
	has_and_belongs_to_many :users
end
