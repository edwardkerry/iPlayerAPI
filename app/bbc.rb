require 'sinatra/base'
require 'haml'

require './app/lib/APIQuery'

class BBC < Sinatra::Base
  get '/' do
    haml :index
  end

  get '/search' do
    api = APIQuery.new
    @results = api.search(params[:letter])
    haml :result
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
