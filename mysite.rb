require 'sinatra'
require 'sinatra/reloader'
require './lib/scrabble'

class MySite <Sinatra::Base
  register Sinatra::Reloader

  get "/" do
    erb :score
  end
end
