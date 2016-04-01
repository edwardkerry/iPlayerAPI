feature 'Search results' do

  WebMock.allow_net_connect!

  scenario 'Searching should change path' do
    search_a
    expect(page).to have_current_path('/result?letter=A&page=1')
  end

  scenario 'Searching should return titles' do
    visit('/')
    click_link('C')
    expect(page).to have_content('Cacamwnci')
  end

  scenario 'Searching should return images' do
    visit('/')
    click_link('C')
    expect(page).to have_css("img[src*='406x228/p03k2nzm.jpg']")
  end

  scenario 'Searching should reveal synopses' do
    visit('/')
    click_link('F')
    expect(page).to have_content('Facelifts and Fillers')
  end

  scenario 'Returning to the homepage' do
    search_a
    click_link('Home')
    expect(page).to have_content 'Welcome to BBC iPlayer'
  end

end
