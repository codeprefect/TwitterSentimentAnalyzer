require_relative "helper"
require_relative "account_details"

class TweetFetcher
  include Tweeter, Helper
  def initialize(user, count)
    @user = Tweeter::Twitter_Account.new(user)
    @count = count
  end
  
  def get_tweets_array
    tweet_collect(@count)
  end

  def count_words_in_tweet
    Helper.words_counter
  end
end

mubarak = TweetFetcher.new("mubarakadeimam", 10)
puts mubarak.get_feed_file(10)
