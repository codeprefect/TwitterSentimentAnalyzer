require "rubygems"
require "oauth"
require "date"
require_relative "./connection"
require_relative "./helper"
require_relative "andeltsa/version"

module Andeltsa
  # Your code goes here...
  class TwitterRequest
    include Helper, Connection
    attr_accessor :username, :date, :tweets_words, :okay_words, :words_rank
    def initialize(username, date)
      @username = username
      @date = date
      @tweets_words = tweet_collect
      @okay_words = Helper.remove_stop_words(tweets_words)
      @words_rank = Helper.rank_words(okay_words)
    end

    def tweet_collect
      Connection.tweets_request(username, date)
      tweets_only = File.open("./tweets_only_#{username}.json", "r")
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
end
