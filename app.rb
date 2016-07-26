require 'sinatra/base'

class BM < Sinatra::Base
  get '/' do
    'Hello BM!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
