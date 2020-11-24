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

def follow_hello(client)
  client.search("#bonjour_monde", result_type: "recent").take(20).map do |tweet|
    client.follow(tweet.user)
  end
end

puts follow_hello(client)