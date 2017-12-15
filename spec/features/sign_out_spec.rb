feature 'Signing out' do
  scenario 'A user can sign out and a goodbye message is displayed' do
    sign_up("me@test.com", "pass", "pass" )
    visit '/links'
    click_on "sign out"
    expect(page).to have_content("Goodbye")
  end
end
