require_relative "andelatsa/version"
require_relative "helper"
require "rubygems"
require "oauth"
require "date"
require 'date'

# The CLI
print "+#{'=='*24}=+"
puts "\n|#{' ' * 6}Welcome to Twitter Sentiment Analyzer#{' ' * 6}|"
puts "|#{' ' * 11}An Andela BootCamp Project#{' ' * 12}|"
puts "|#{' ' * 23}by#{' ' * 24}|"
puts "|#{' ' * 14}Mubarak Adeshina IMAM#{' ' * 14}|\n"
print "+#{'=='*24}=+"
puts "\n\n#{' ' * 1}Please wait while we connect to"\
  " the Twitter API#{' ' * 1}\n\n"

require_relative "connection"

if Connection.response_code == "200"
  puts "Connection successful"
else
  puts "Connection failed"
end

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
    Connection.tweets_request(self.username, self.date)
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

this_day = Date.today
last_week = this_day - 7
last_month = this_day - 30

condition = true
while condition
  print "\nPlease, enter you Twitter Handle: "
  username = gets.chomp
  print "\nPlease enter 1 to examine the tweets since last week\n"\
    "or enter 2 to examine the tweets since last month: "
  response = gets.chomp.to_i
  case response
  when 1
    since_date = last_week
  when 2
    since_date = last_month
  end

  user = TwitterRequest.new(username, since_date)
  Helper.display_ranking(user.words_rank)

  File.delete(
  "tweets_only_#{username}.json",
  "full_tweets_#{username}.json")

  puts "Do you want to exit from the app? Yes/No"
  response = gets.chomp.downcase
  case response
  when "yes" || "y"
    condition = false
    puts "Thank you for your time. pls follow @andela and"
    puts "@mubarakadeimam on Twitter"
  when "no"
    puts "Okay, now you can continue"
  else
    puts "Sorry, I don't get that"
  end
end
