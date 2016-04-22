require 'net/http'
require 'json'

class APIQuery

  attr_reader :baseURL, :pageCount, :results

  BASE = 'https://ibl.api.bbci.co.uk/ibl/v1/atoz/'

  def initialize(url=BASE)
    @baseURL = url
    @results = nil
    @pageCount = nil
  end

  def search(letter, page)
    hit_api(letter, page)
    get_medium_images
  end

  private

  def hit_api(letter, page)
    uri = URI(@baseURL+letter.downcase+'/programmes?page='+page)
    response = JSON.parse(Net::HTTP.get(uri), symbolize_names: true)
    count_pages(response[:atoz_programmes][:count], response[:atoz_programmes][:per_page])
    @results = response[:atoz_programmes][:elements]
  end

  def get_medium_images
    @results.each do |prog|
      prog[:images][:standard].gsub!('{recipe}', '406x228')
    end
  end

  def count_pages(prog_count, per_page)
    @pageCount = (prog_count / per_page.to_f).ceil
  end

end
