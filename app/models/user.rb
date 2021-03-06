# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  username      :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class User < ActiveRecord::Base
	attr_accessible :name, :username, :password, :password_confirmation
	attr_accessor :password

	before_save :encrypt_password

	has_many :tweets, through: :tweet_users
	has_many :tweet_users, dependent: :destroy
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed
	has_many :followers, through: :reverse_relationships

	validates_presence_of :name
	validates :username, presence: true, uniqueness: true
	validates_presence_of :password, on: :create
	validates_confirmation_of :password

	def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

	def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def following? user
  	relationships.find_by_followed_id(user.id)
  end

  def retweeted? tweet
  	tweet_users.find_by_tweet_id(tweet.followed_id)
  end

  def to_param
  	username
  end
end
