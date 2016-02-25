require "rubygems"
require "oauth"
require "./connection"
require "./helper"

class TwitterRequest
  include Helper, Connection
  attr_accessor :username, :count, :tweets_words, :okay_words, :words_rank
  def initialize(username, count)
    @username = username
    @count = count
    @tweets_words = tweet_collect
    @okay_words = Helper.remove_stop_words(tweets_words)
    @words_rank = Helper.rank_words(okay_words)
  end

  def tweet_collect
    Connection.tweets_request(username, count)
    tweets_only = File.open("tweets_only_#{username}.json", "r")
    tweets_words = []
    tweets_only.each do |tweet|
      tweets_words << tweet
    end
    tweets_words.join(" ").split(/[^a-zA-Z]/)
  end

  def count_words_in_tweet
    Helper.words_counter
  end
end
