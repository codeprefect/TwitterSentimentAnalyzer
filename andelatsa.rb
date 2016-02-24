require_relative "helper"
require_relative "account_details"

mubarak = Tweeter::Twitter_Account.new("mubarakadeimam")

puts mubarak.get_feed(1)["text"]
