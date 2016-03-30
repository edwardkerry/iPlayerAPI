feature 'Clicking search letters' do
  scenario 'Searching on A' do
    visit('/')
    click_link('A')
    expect(page).to have_current_path('/search?letter=A')
  end

  scenario 'Searching on C' do
    visit('/')
    click_link('C')
    expect(page).to have_current_path('/search?letter=C')
  end

  scenario 'Searching on B' do
    visit('/')
    click_link('B')
    expect(page).to have_content('Babar Ahmad')
  end
end
