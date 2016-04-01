require 'net/http'
require 'json'

class APIQuery

  attr_reader :baseURL

  BASE = 'https://ibl.api.bbci.co.uk/ibl/v1/atoz/'

  def initialize(url=BASE)
    @baseURL = url
    @results = nil
    @pageCount = nil
  end

  def search(letter)
    hit_api(letter)
    get_medium_images
  end

  private

  def hit_api(letter)
    uri = URI(@baseURL+downcase(letter)+'/programmes')
    fullRes = JSON.parse(Net::HTTP.get(uri), symbolize_names: true)
    @results = fullRes[:atoz_programmes][:elements]
  end

  def get_medium_images
    @results.each do |prog|
      prog[:images][:standard].gsub!('{recipe}', '406x228')
    end
  end

  def downcase(letter)
    /[A-Z]/.match(letter) ? letter.downcase : letter
  end

end
