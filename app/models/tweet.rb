# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  body       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  private    :boolean
#

class Tweet < ActiveRecord::Base
	attr_accessible :body, :user_id, :private

	belongs_to :user
	validates :body, presence: true, length: { maximum: 160 }
	validates :user_id, presence: true

	def set_tweet_as_private 
		self.private = true
	end
end
