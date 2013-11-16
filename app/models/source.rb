# == Schema Information
#
# Table name: sources
#
#  id          :integer          not null, primary key
#  source_name :string(255)
#  source_type :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Source < ActiveRecord::Base
	attr_accessible :source_name, :source_type
end
