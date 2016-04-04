feature 'Search results' do

  json = {"atoz_programmes":
    {"count":4, "per_page": 1, "elements": [
      {"title": "A-Team",
      "synopses":
      {"small": "A cool show"},
      "images": {"standard": "http://ichef.bbci.co.uk/images/ic/406x228/a-team.jpg"}
    },
    {"title": "B-Team",
    "synopses":
    {"small": "A bad show"},
    "images": {"standard": "http://ichef.bbci.co.uk/images/ic/406x228/b-team.jpg"}
    }
    ]}
  }

  before(:each) do
    stub_request(:get, "https://ibl.api.bbci.co.uk/ibl/v1/atoz/a/programmes?page=1").
      to_return(:body => json.to_json)
  end

  scenario 'Searching should change path' do
    search_a
    expect(page).to have_current_path('/result?letter=A&page=1')
  end

  scenario 'Searching should return titles' do
    search_a
    expect(page).to have_content('A-Team')
  end

  scenario 'Searching should return images' do
    search_a
    expect(page).to have_css("img[src*='406x228/a-team.jpg']")
  end

  scenario 'Searching should reveal synopses' do
    search_a
    expect(page).to have_content('A cool show')
  end

  scenario 'Clicking title should return to the homepage' do
    search_a
    click_link('BBC A - Z Programme Search')
    expect(page).to have_content 'Welcome to BBC iPlayer'
  end

end
