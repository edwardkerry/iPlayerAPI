describe APIQuery do

subject(:api) {described_class.new}

  describe 'defaults' do
    it 'should initalize with a base URL' do
      expect(api.baseURL).to eq('https://ibl.api.bbci.co.uk/ibl/v1/atoz/')
    end
    it 'should allow base URL to be overwritten' do
      api2 = APIQuery.new('www.bbc.co.uk')
      expect(api2.baseURL).to eq('www.bbc.co.uk')
    end
  end

  xdescribe 'search' do
    it 'should send an http request to the url' do
      expect(api.search('a')).to eq({title: 'A-team', type: 'Episode'})
    end

    xit 'should set @results to the returned JSON' do
      expect(api.results).to eq (items)
    end

    xit 'should set @pageCount to required pages' do
      expect(api.pageCount).to eq (3)
    end
  end

end
