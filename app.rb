require 'sinatra/base'
require './app/models/link.rb'

class Bookmark < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb(:links)
  end

  get '/links/new' do
    erb(:new_link)
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
