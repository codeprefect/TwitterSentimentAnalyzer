#Part 5
#Status update
require 'rubygems'
require 'oauth'
require 'json'

# You will need to set your application type to
# read/write on dev.twitter.com and regenerate your access
# token.  Enter the new values here:
consumer_key = OAuth::Consumer.new(
    "vyD8Kjp2fP05sUXUjWgpW2Iu2",
    "u6tFDV9TQwuLS4pR30NrD5ncHfg2SvozLjCFjUnyVFsE69RBkV")
access_token = OAuth::Token.new(
     "212657683-Ln1rsRDKydHEqcHgl9coIKxzAF7duyEkThJJDx8F",
     "hNxJPcQj0GF1yyjrlvFqFz7fjli8T7KAJA8XqHRmuehiP")

# Note that the type of request has changed to POST.
# The request parameters have also moved to the body
# of the request instead of being put in the URL.
baseurl = "https://api.twitter.com"
path    = "/1.1/statuses/update.json"
address = URI("#{baseurl}#{path}")
request = Net::HTTP::Post.new address.request_uri
request.set_form_data(
  "status" => "Testing the twitter api",
)

# Set up HTTP.
http             = Net::HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# Issue the request.
request.oauth! http, consumer_key, access_token
http.start
response = http.request request

# Parse and print the Tweet if the response code was 200
tweet = nil
if response.code == '200' then
  tweet = JSON.parse(response.body)
  puts "Successfully sent #{tweet["text"]}"
else
  puts "Could not send the Tweet! " +
  "Code:#{response.code} Body:#{response.body}"
end