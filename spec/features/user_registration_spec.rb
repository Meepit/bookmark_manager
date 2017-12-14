feature 'Registering a user' do
  scenario 'A user can register and the page will welcome the user with an inreased user count' do
    user_count = User.count
    visit '/register'
    fill_in 'email', with: "testemail@testserver.com"
    fill_in 'password', with: "testpassword"
    expect(page).to have_content("testemail@testserver.com")
    expect(User.count).to eq user_count + 1
  end
end
