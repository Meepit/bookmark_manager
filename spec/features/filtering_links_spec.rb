feature "Filter links by" do
  scenario "filter links by tag bubble"do
    visit('/links/new')
    fill_in :title, with: "Facebook"
    fill_in :url,   with: "https://www.facebook.com/"
    fill_in :tags,   with: "Bubbles"
    click_button "Add"
    visit('/links/new')
    fill_in :title, with: "Github"
    fill_in :url,   with: "https://www.github.com/"
    fill_in :tags,   with: "Bubbles"
    click_button "Add"
      visit('/links/new')
    fill_in :title, with: "Yahoo"
    fill_in :url,   with: "https://www.yahoo.com/"
    fill_in :tags,   with: "Squares"
    click_button "Add"
      visit('/links/new')
    fill_in :title, with: "Twitter"
    fill_in :url,   with: "https://www.twitter.com/"
    fill_in :tags,   with: "Squares"
    click_button "Add"
    visit('/tag/Bubbles')
    expect(page).to have_content("Facebook")
    expect(page).to have_content("Github")
    expect(page).to_not have_content("Yahoo")
    expect(page).to_not have_content("Twitter")
  end
end
