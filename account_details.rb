require "rubygems"
require "oauth"
require_relative "connection"
require_relative "helper"

class Twitter_Request
  include Helper, Connection
  attr_accessor :username, :count, :tweets_only, :okay_words, :words_rank
  def initialize(username, count)
    @username = username
    @count = count
    @tweets_only = self.tweet_collect
    @okay_words = self.remove_stop_words
    @words_rank = self.rank_words
  end

  def tweet_collect
    tweets_hash = Connection.feed_request(self.username, self.count)
    tweets_only = [] #File.open("tweets_only.yml", "w+")
    tweets_hash.each do |tweet|
      tweets_only << tweet["text"]
    end
    tweets_only.join(' ').split(/[^a-zA-Z]/)
  end

  def remove_stop_words
    tweets = self.tweets_only
    stop_words_file = File.open("stop_words.json", "r+")
    stop_words = []
    stop_words_file.each { |x|
      stop_words << x
    }
    stop_words = stop_words.join(" ").split(',')
    stop_words_free = []
    tweets.each do |word|
      if stop_words.include?word
        nil
      else
        stop_words_free << word
      end
    end
    stop_words_free.join(" ")
  end

  def count_words_in_tweet
    Helper.words_counter
  end

  def sort_hash_descend(value)
    sorted_hash = Hash.new
    value.sort_by { |_x, y| -y }.each do |val|
      sorted_hash[val[0]] = val[1]
    end
    sorted_hash
  end

  # Counts the occurence of words in a string and returns 'word => frequency'
  def words_counter(sentence)
    word_list = sentence.split(" ")
    word_map = Hash.new
    word_list.each do |word|
      word.downcase!
      if word.length > 2
        if word_map.key?(word)
          word_map[word] += 1
        else
          word_map[word] = 1
        end
      end
    end
    word_map
  end

  def rank_words
    sort_hash_descend(words_counter(self.okay_words))
  end
end
  
mubarak = Twitter_Request.new("andela", 50)
mubarak.words_rank.each{ |x,y| puts "#{x}: #{y}"}
