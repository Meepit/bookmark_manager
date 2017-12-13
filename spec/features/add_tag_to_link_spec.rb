feature 'add tag to link' do
  scenario 'A tag can be added to a link' do
    visit('/links/new')
    fill_in :title, with: "Facebook"
    fill_in :url,   with: "https://www.facebook.com/"
    fill_in :tags,  with: "Social"
    click_button "Add"
    expect(page).to have_content("Social")
  end
end
