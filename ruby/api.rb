#!/usr/bin/ruby

require 'sinatra'
require 'date'
require 'json'

set :server, %w[thin mongrel webrick]
set :bind, '0.0.0.0'
set :port => 8080
set :logging, false

get '/' do
    "Hello World!\n"
end

get '/time' do
    Time.now.to_datetime.rfc3339 + "\n"
end

post '/sort' do
    begin
        body = JSON.parse request.body.read
        JSON.generate(body.sort)
    rescue
        return 400
    end
end
