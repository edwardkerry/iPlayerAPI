feature 'Search results' do
  scenario 'Searching should change path' do
    search_a
    expect(page).to have_current_path('/result?letter=A&page=1')
  end

  scenario 'Searching should reveal titles' do
    visit('/')
    click_link('C')
    expect(page).to have_content('Cacamwnci')
  end

  scenario 'Searching should reveal images' do
    visit('/')
    click_link('C')
    expect(page).to have_css("img[src*='406x228/p03k2nzm.jpg']")
  end

  scenario 'Searching should reveal synopses' do
    visit('/')
    click_link('F')
    expect(page).to have_content('Going under the knife')
  end

end
