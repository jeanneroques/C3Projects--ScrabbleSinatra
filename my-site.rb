require "sinatra"
require "sinatra/reloader"
require "./lib/scoring"

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :score
  end

  post "/" do
  	@word = params[:word]
  	erb :score
  end

end
