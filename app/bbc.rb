require 'sinatra/base'
require 'haml'

require './app/lib/APIQuery'

class BBC < Sinatra::Base
  get '/' do
    api
    haml :index
  end

  get '/result' do
    @results = api.search(params[:letter], params[:page])
    @letter = params[:letter]
    @pages = api.pageCount
    haml :result
  end

  helpers do
    def api
      @api ||= APIQuery.new
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
