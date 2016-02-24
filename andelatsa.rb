require_relative "helper"
require_relative "account_details"

class TweetFetcher
  include Tweeter, Helper
  def initialize(user, count)
    @user = Tweeter::Twitter_Account.new(user)
    @count = count
  end

  def tweet_store
    tweet_file = File.open("tweets.json", "w+")
    tweet_file << @user.tweet_collect(@count)
  end
end

mubarak = TweetFetcher.new("amoralyn", 10)
puts mubarak.tweet_store
