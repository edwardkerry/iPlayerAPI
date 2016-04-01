feature 'Pagination buttons' do

  WebMock.allow_net_connect!

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
    expect(page).to have_content('Alistair Cooke\'s America')

  end
end
