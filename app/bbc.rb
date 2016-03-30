require 'sinatra/base'
require 'haml'

class BBC < Sinatra::Base
  get '/' do
    haml :index
  end

  get '/search' do
    haml :result
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
