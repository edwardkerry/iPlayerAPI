require 'net/http'
require 'json'

class APIQuery

  attr_reader :baseURL

  BASE = 'https://ibl.api.bbci.co.uk/ibl/v1/atoz/'

  def initialize(url=BASE)
    @baseURL = url
  end

  def search(letter)
    letter = downcase_letter(letter)
    uri = URI(@baseURL+letter+'/programmes?page=1')
    res = Net::HTTP.get(uri)
    fullRes = JSON.parse(res, symbolize_names: true)
    library = fullRes[:atoz_programmes]
    library[:elements]
  end

private

  def downcase_letter(letter)
    /[A-Z]/.match(letter) ? letter.downcase : letter.to_s
  end

end
