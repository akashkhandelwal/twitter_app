class CreateTweetUsers < ActiveRecord::Migration
  def change
    create_table :tweet_users do |t|
      t.integer :user_id
      t.integer :tweet_id

      t.timestamps
    end
  end
end
