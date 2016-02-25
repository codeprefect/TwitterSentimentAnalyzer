require "rubygems"
require "oauth"
require "json"

module Connection
  # Change the following values to those provided on dev.twitter.com
  # The consumer key identifies the application making the request.
  # The access token identifies the user making the request.
  @consumer_key = OAuth::Consumer.new(
    "vyD8Kjp2fP05sUXUjWgpW2Iu2",
    "u6tFDV9TQwuLS4pR30NrD5ncHfg2SvozLjCFjUnyVFsE69RBkV")
  @access_token = OAuth::Token.new(
    "212657683-Ln1rsRDKydHEqcHgl9coIKxzAF7duyEkThJJDx8F",
    "hNxJPcQj0GF1yyjrlvFqFz7fjli8T7KAJA8XqHRmuehiP")

  # All requests will be sent to this server.
  @base_url = "https://api.twitter.com"

  # The verify credentials endpoint returns a 200 status if
  # the request is signed correctly.
  address = URI("#{@base_url}/1.1/account/verify_credentials.json")

  # Set up Net::HTTP to use SSL, which is required by Twitter.
  http = Net::HTTP.new address.host, address.port
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  # Build the request and authorize it with OAuth.
  request = Net::HTTP::Get.new address.request_uri
  request.oauth! http, @consumer_key, @access_token

  # Issue the request and return the response.
  http.start
  @response = http.request request

  def self.response_code
    @response.code
  end

  def self.tweets_request(username, num_tweets)
    path    = "/1.1/statuses/user_timeline.json"
    query   = URI.encode_www_form(
      "screen_name" => username,
      "count" => num_tweets)
    address = URI("#{@base_url}#{path}?#{query}")
    request = Net::HTTP::Get.new address.request_uri
    http = Net::HTTP.new address.host, address.port
    http.use_ssl     = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    request.oauth! http, @consumer_key, @access_token
    http.start
    response = http.request request
    tweets_json = File.open("full_tweets_#{username}.json", "w+")
    tweets_json << response.body
    tweets_json.close
    tweets_hash = JSON.parse(File.read("full_tweets_#{username}.json"))
    tweets_only = File.open("tweets_only_#{username}.json", "w+")
    tweets_hash.each { |tweets| tweets_only << tweets["text"] + " " }
    tweets_only.close
  end
end
