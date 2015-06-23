require "sinatra"
require "sinatra/reloader"
require "./lib/result.rb"

class MySite < Sinatra::Base
  register Sinatra::Reloader

  get '/' do
    erb :home
  end

  get '/score' do
    erb :score
  end

  post '/score' do
    @word = params[:word]
    @answer = Scrabble::Scrabble.score(@word)
    @letters = Scrabble::Scrabble.score_letters(@word)
    erb :score
  end


  get '/lotsa' do
    erb :lotsa
  end

# All of the logic happens here so we can call upon results
  post '/lotsa' do
    @wordarray = params[:morewords]
    @manyscores = []
    @wordarray.each do |word|
      @manyscores.push (Scrabble::Scrabble.score(word))
    end
    erb :lotsa
  end

end
