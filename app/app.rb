ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/link.rb'
require './data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new
  end

  post '/links' do
    tag = Tag.create(name: params[:tag])
    link = Link.create(url: params[:url], title: params[:title])
    link.tags << tag
    link.save
    redirect "/links"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
