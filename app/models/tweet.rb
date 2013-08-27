# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  body       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Tweet < ActiveRecord::Base
	attr_accessible :body

	belongs_to :user
	validates :user_id, presence: true, length: { maximum: 160 }
end
