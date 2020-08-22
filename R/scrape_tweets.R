library(rtweet)

# Token
twitter_token <- create_token(
  app = Sys.getenv("app_name"),
  consumer_key = Sys.getenv("consumer_key"),
  consumer_secret = Sys.getenv("consumer_secret"),
  access_token = Sys.getenv("access_token"),
  access_secret = Sys.getenv("access_secret")
)

# User vector 
user <- c("FallGuysGame")

# Retrieve last 3200 tweets
tweets <- get_timeline(user, n = 3200, token = twitter_token, lang = "en")

# Write to csv
write_as_csv(tweets, here::here('data', 'tweets.csv'))