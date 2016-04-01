feature 'Clicking search letters' do
  scenario 'Searching on A' do
    visit('/')
    click_link('A')
    expect(page).to have_current_path('/result?letter=A&page=1')
  end

  scenario 'Searching on B' do
    visit('/')
    click_link('B')
    expect(page).to have_current_path('/result?letter=B&page=1')
  end

  scenario 'Searching on digits' do
    visit('/')
    click_link('0-9')
    expect(page).to have_current_path('/result?letter=0-9&page=1')
  end

  scenario 'Searching on C' do
    visit('/')
    click_link('C')
    expect(page).to have_content('Cacamwnci')
  end
end
