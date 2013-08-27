# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	attr_accessible :name, :user_name

	has_many :tweets, dependent: :destroy

	validates :name, presence: true
	validates :user_name, presence: true, uniqueness: true
end
