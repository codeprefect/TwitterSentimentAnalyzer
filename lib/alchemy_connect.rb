require "././alchemyapi_ruby/alchemyapi"

module SentimentAnalysis
  def self.get_sentiment(tweets)
    alchemyapi = AlchemyAPI.new
    response = alchemyapi.sentiment("text", tweets)

    if response["status"] == "OK"
      puts '## Response Object ##'
      puts JSON.pretty_generate(response)
      puts ""
      puts '## Document Sentiment ##'
      puts "type: " + response["docSentiment"]["type"]
      # Make sure score exists (it's not returned for neutral sentiment
      if response["docSentiment"].key?("score")
        puts "score: " + response["docSentiment"]["score"]
      end
    else
      puts "Error in sentiment analysis call: " + response["statusInfo"]
    end
  end
end
