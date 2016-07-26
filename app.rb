require 'sinatra/base'

class BM < Sinatra::Base
  get '/' do
    redirect '/links'
  end

  get '/links' do
    
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
