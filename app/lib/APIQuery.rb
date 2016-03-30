class APIQuery

  attr_reader :baseURL

  BASE = 'https://ibl.api.bbci.co.uk'

  def initialize(url=BASE)
    @baseURL = url
  end

end
