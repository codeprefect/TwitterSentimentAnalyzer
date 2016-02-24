require "rubygems"
require "oauth"
require_relative "connection"

module Tweeter
  class Twitter_Account
    include Connection
    attr_accessor :username
    def initialize(username)
      @username = username
    end

    def get_feed(count)
      Connection.feed_request(@username, count)
    end

    # ADD CODE TO ITERATE THROUGH EACH TWEET AND PRINT ITS TEXT

    def tweet_collect(count)
      tweets_hash = get_feed(count)
      @tweets_only = []
      tweets_hash.each do |tweet|
        @tweets_only << tweet['text']
      end
      @tweets_only
    end
  end
end