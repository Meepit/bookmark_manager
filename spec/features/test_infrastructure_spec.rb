feature "testing infrastructure" do
  scenario "homepage has content" do
    visit('/links')

    expect(page).to have_content("Bookmark")
  end

  scenario "homepage has a link" do
    Link.create(url: "http://www.makersacademy.com/", title: "Makers")
    visit('/links')
    expect(page).to have_content("http://www.makersacademy.com/")
  end
end
