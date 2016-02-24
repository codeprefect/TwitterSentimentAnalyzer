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
  end
end
