# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  body       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  private    :boolean
#

class Tweet < ActiveRecord::Base
	attr_accessible :body, :private

	has_many :users, through: :tweet_users
	has_many :tweet_users

	validates :body, presence: true, length: { maximum: 160 }

	def set_tweet_as_private 
		self.private = true
	end

	def associate_tweet_with_user user
		relationship = self.tweet_users.build
		relationship.user = user
		relationship.save
	end
end
