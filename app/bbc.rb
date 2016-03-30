require 'sinatra/base'

class BBC < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/search' do
    erb :search
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
