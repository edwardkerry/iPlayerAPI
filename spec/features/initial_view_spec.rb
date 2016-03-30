feature "Homepage" do
  scenario "Searchable letters" do
    visit('/')
    expect(page).to have_link('A')
    expect(page).to have_link('Z')
  end
end
