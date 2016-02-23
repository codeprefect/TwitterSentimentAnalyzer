module Connection
  
  require 'rubygems'
  require 'oauth'

  ###################### SETTING UP CONNECTION TO THE API #########################

  # Change the following values to those provided on dev.twitter.com
  # The consumer key identifies the application making the request.
  # The access token identifies the user making the request.
  CONSUMER_KEY = OAuth::Consumer.new(
      "vyD8Kjp2fP05sUXUjWgpW2Iu2",
      "u6tFDV9TQwuLS4pR30NrD5ncHfg2SvozLjCFjUnyVFsE69RBkV")
  ACCESS_TOKEN = OAuth::Token.new(
       "212657683-Ln1rsRDKydHEqcHgl9coIKxzAF7duyEkThJJDx8F",
       "hNxJPcQj0GF1yyjrlvFqFz7fjli8T7KAJA8XqHRmuehiP")

  # All requests will be sent to this server.
  baseurl = "https://api.twitter.com"

  # The verify credentials endpoint returns a 200 status if
  # the request is signed correctly.
  address = URI("#{baseurl}/1.1/account/verify_credentials.json")

  # Set up Net::HTTP to use SSL, which is required by Twitter.
  http = Net::HTTP.new address.host, address.port
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  # Build the request and authorize it with OAuth.
  request = Net::HTTP::Get.new address.request_uri
  request.oauth! http, CONSUMER_KEY, ACCESS_TOKEN

  # Issue the request and return the response.
  http.start
  response = http.request request
  puts "The response status was #{response.code}"

end