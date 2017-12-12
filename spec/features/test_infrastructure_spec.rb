feature "testing infrastructure" do
  scenario "homepage has content" do
    visit('/links')

    expect(page).to have_content("Bookmark")
  end

  scenario "homepage has a link" do
    visit('/links')
    Link.create(url: "http://www.makersacademy.com/", title: "Makers")
    expect(page).to have_content("http://www.makersacademy.com/")
  end
end
