feature 'Clicking search letters' do
  scenario 'Searching on A' do
    visit('/')
    click_link('A')
    expect(page).to have_current_path('/result?letter=A')
  end

  scenario 'Searching on B' do
    visit('/')
    click_link('B')
    expect(page).to have_current_path('/result?letter=B')
  end

  xscenario 'Searching on digits' do
    visit('/')
    click_link(7)
    expect(page).to have_current_path('/result?letter=7')
  end

  scenario 'Searching on C' do
    visit('/')
    click_link('C')
    expect(page).to have_content('Cacamwnci')
  end
end
