require 'sinatra'
require 'sinatra/cookies'
require 'redis'
require 'json'
require 'socket'

set :bind, '0.0.0.0'
set :port, 80
set :public_folder, 'public'

option_a = ENV['OPTION_A'] || 'Cats'
option_b = ENV['OPTION_B'] || 'Dogs'
hostname = Socket.gethostname

def redis_client
  Redis.new(host: 'redis', db: 0)
end

get '/' do
  locals = {option_a: option_a, option_b: option_b, hostname: hostname, vote: nil}
  erb :index, locals: locals
end

post '/' do
  voter_id = cookies[:voter_id]
  unless voter_id
    voter_id = SecureRandom.hex
    cookies[:voter_id] = voter_id
  end

  vote = params[:vote]
  data = JSON.dump({voter_id: voter_id, vote: vote})
  redis_client.rpush("votes", data)

  locals = {option_a: option_a, option_b: option_b, hostname: hostname, vote: vote}
  erb :index, locals: locals
end
