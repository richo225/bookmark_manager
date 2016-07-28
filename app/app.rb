ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/models/link.rb'
require './app/models/tag.rb'
require './app/models/user.rb'
require './data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base

  enable :sessions

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
    link = Link.create(url: params[:url], title: params[:title])
    params[:tag].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect "/links"
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end

  post '/sign_up' do
    User.create(email_address: params[:email_address], password: params[:password])
    redirect '/links'
  end

  get '/sign_up' do
    erb :sign_up
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
