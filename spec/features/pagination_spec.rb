feature 'Pagination buttons' do
  scenario 'Searching A should reveal four page buttons' do
    visit('/')
    click_link('A')
    expect(page).to have_link('Page 1')
    expect(page).to have_link('Page 2')
    expect(page).to have_link('Page 3')
    expect(page).to have_link('Page 4')
  end
end
