# == Schema Information
#
# Table name: interests
#
#  id            :integer          not null, primary key
#  interest_name :string(255)
#  source_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Interest < ActiveRecord::Base
	attr_accessible :interest_name, :source_id
	has_and_belongs_to_many :users, :uniq => true
	belongs_to :sources
end
