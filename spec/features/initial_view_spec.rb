feature "Homepage" do
  scenario "Should alphanumeric search links" do
    visit('/')
    expect(page).to have_link('G')
    expect(page).to have_link('0-9')
  end
end
