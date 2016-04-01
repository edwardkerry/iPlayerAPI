require 'net/http'
require 'json'

class APIQuery

  attr_reader :baseURL, :pageCount

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
    uri = URI(@baseURL+downcase(letter)+'/programmes?page='+page)
    fullRes = JSON.parse(Net::HTTP.get(uri), symbolize_names: true)
    count_pages(fullRes[:atoz_programmes][:count])
    @results = fullRes[:atoz_programmes][:elements]
  end

  def get_medium_images
    @results.each do |prog|
      prog[:images][:standard].gsub!('{recipe}', '406x228')
    end
  end

  def count_pages(number)
    @pageCount = (number / 20.0).ceil
  end

  def downcase(letter)
    /[A-Z]/.match(letter) ? letter.downcase : letter
  end

end
