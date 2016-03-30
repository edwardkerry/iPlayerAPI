describe APIQuery do

subject(:api) {described_class.new}

describe 'defaults' do
  it 'should initalize with a base URL' do
    expect(api.baseURL).to eq ('https://ibl.api.bbci.co.uk')
  end
  it 'should allow base URL to be overwritten' do
    api2 = APIQuery.new('www.bbc.co.uk')
    expect(api2.baseURL).to eq ('www.bbc.co.uk')
  end
end

end
