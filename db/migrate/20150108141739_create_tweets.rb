class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweet_text, limit: 4
      t.string :location
      t.references :user, index: true

      t.timestamps
    end
  end
end
