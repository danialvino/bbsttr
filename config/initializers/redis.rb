$redis = Redis.new

url = ENV["REDISCLOUD_URL"]

if url
  Sidekiq.configure_server do |config|
    config.redis = { url: url }
  end

  Sidekiq.configure_client do |config|
    config.redis = { url: url }
  end
  $redis = Redis.new(:url => url)
end
UPDATE YOUR PROCFILE FILE
# Procfile
web: bundle exec puma -C config/puma.rb
worker: bundle exec sidekiq -C config/sidekiq.yml
Then you must:
Commit
Deploy
Go to Heroku Dashboard to set dynos. Or your cli:
heroku ps:scale worker=1
heroku ps # Check worker dyno is running
HEROKU CRON JOBS
Use the Heroku Scheduler



HAPPY ASYNCHRONIZING!
