feature "Filter links by" do
  scenario "filter links by tag bubble"do
    Link.create(title: "Facebook", url: 'facebook.com', tags: [Tag.first_or_create(name: "Bubbles")])
    Link.create(title: "Github", url: "github.com", tags: [Tag.first_or_create(name: "Bubbles")])
    Link.create(title: "Yahoo", url: "yahoo.com", tags: [Tag.first_or_create(name: "Squares")])
    Link.create(title: "Twitter", url: "twitter.com", tags: [Tag.first_or_create(name: "Squares")])
    visit('/tag/Bubbles')
    expect(page).to have_content("Facebook")
    expect(page).to have_content("Github")
    expect(page).to_not have_content("Yahoo")
    expect(page).to_not have_content("Twitter")
  end
end
