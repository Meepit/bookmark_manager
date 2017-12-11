feature "testing infrastructure" do
  scenario "homepage has content" do
    visit('/home')

    expect(page).to have_content("Bookmark")
  end
end
