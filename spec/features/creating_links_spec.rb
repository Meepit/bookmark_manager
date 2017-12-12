feature "creating links" do
  scenario "adding a link and title to the bookmarks page" do
    visit('/links/new')
    fill_in :title, with: "Facebook"
    fill_in :url,   with: "https://www.facebook.com/"
    click_button "Add"
    expect(page).to have_content "https://www.facebook.com/"
  end
end
