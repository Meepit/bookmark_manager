feature 'Adding multiple tags to a link' do
  scenario 'We can add multiple tags to a link' do
    visit '/links/new'
    fill_in :title, with: "google"
    fill_in :url, with: "www.google.com"
    fill_in :tags, with: "tech, education, flowers"
    click_button "Add"
    expect(page).to have_content("tech; education; flowers")
  end
end
