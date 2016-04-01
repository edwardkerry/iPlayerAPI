describe APIQuery do

  subject(:api) {described_class.new}

  json = {"atoz_programmes":
    {"count":74, "per_page": 20, "elements": [
      {"title": "A-Team",
      "synopses":
      {"small": "A cool show"},
      "images": {"standard": "http://ichef.bbci.co.uk/images/ic/40x228/p02c72z7.jpg"}
      }
    ]}
  }

  describe 'defaults' do
    it 'should initalize with a base URL' do
      expect(api.baseURL).to eq("https://ibl.api.bbci.co.uk/ibl/v1/atoz/")
    end
    it 'should allow base URL to be overwritten' do
      api2 = APIQuery.new('www.bbc.co.uk')
      expect(api2.baseURL).to eq('www.bbc.co.uk')
    end
  end

  describe 'search' do

    before(:each) do
      stub_request(:get, "https://ibl.api.bbci.co.uk/ibl/v1/atoz/a/programmes?page=1").
        to_return(:body => json.to_json)
    end

    it 'should send an http request to the url' do
      api.search('a', '1')
      expect(WebMock).to have_requested(:get, "https://ibl.api.bbci.co.uk/ibl/v1/atoz/a/programmes?page=1")
    end

    it 'should set @results to the returned JSON' do
      api.search('a', '1')
      expect(api.results).to eq(json[:atoz_programmes][:elements])
    end

    it 'should set @pageCount to required pages' do
      api.search('a', '1')
      expect(api.pageCount).to eq(4)
    end
  end

end
