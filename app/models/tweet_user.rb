# == Schema Information
#
# Table name: tweet_users
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  tweet_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class TweetUser < ActiveRecord::Base
	attr_accessible :user_id, :tweet_id

	belongs_to :user
	belongs_to :tweet
end
