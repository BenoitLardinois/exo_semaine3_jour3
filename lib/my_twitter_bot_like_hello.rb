require 'twitter'
require 'dotenv'
require 'pry'

Dotenv.load('.env')

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
  config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
  config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
end

def like_hello_world(client)
  tweets = client.search("#bonjour_monde", result_type: "recent").take(5)
  client.favorite(tweets)
end
  
puts like_hello_world(client)