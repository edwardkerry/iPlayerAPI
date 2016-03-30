feature "Homepage" do
  scenario "Should have alphabet of links" do
    visit('/')
    expect(page).to have_link('A')
    expect(page).to have_link('Z')
  end
end
