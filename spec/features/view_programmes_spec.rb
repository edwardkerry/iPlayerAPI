feature 'Default view' do
  scenario 'opening site' do
    visit('/')
    click_link('A')
    expect(page).to have_content('Abadas')
  end
end
