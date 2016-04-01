feature "Homepage" do
  scenario "Should have alphabet of links" do
    visit('/')
    expect(page).to have_link('G')
    expect(page).to have_link('0-9')
  end
end
