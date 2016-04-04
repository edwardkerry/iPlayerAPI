feature 'Pagination buttons' do

  json = {"atoz_programmes":
    {"count":4, "per_page": 1, "elements": [
      {"title": "A-Team",
      "synopses":
      {"small": "A cool show"},
      "images": {"standard": "http://ichef.bbci.co.uk/images/ic/40x228/b-team.jpg"}
    },
    {"title": "B-Team",
    "synopses":
    {"small": "A bad show"},
    "images": {"standard": "http://ichef.bbci.co.uk/images/ic/40x228/a-team.jpg"}
    }
    ]}
  }

  before(:each) do
    stub_request(:get, "https://ibl.api.bbci.co.uk/ibl/v1/atoz/a/programmes?page=1").
      to_return(:body => json.to_json)
    stub_request(:get, "https://ibl.api.bbci.co.uk/ibl/v1/atoz/a/programmes?page=2").
      to_return(:body => json.to_json)
  end


  scenario 'Searching A should reveal four page buttons' do
    search_a
    expect(page).to have_link('Page 1')
    expect(page).to have_link('Page 2')
    expect(page).to have_link('Page 3')
    expect(page).to have_link('Page 4')
  end

  scenario 'Clicking page button should change search page' do
    search_a
    click_link('Page 2')
    expect(page).to have_content('B-Team')

  end
end
