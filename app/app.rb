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
    tag.name = tag.name.split.join(",")
    link.tags << tag
    link.save
    redirect "/links"
  end

  get '/tags/:name' do
    tag = Tag.first_or_create(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

#"tag1 tag2"
#[tag1, tag2]
