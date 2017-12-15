feature 'Registering a user' do
  scenario 'A user can register and the page will welcome the user with an inreased user count' do
    user_count = User.count
    visit '/users/new'
    fill_in 'email', with: "testemail@testserver.com"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "testpassword"
    click_on "create"
    expect(page).to have_content("testemail@testserver.com")
    expect(User.count).to eq user_count + 1
  end
  scenario 'A user fills in mismatching passwords' do
  	user_count = User.count
    visit '/users/new'
    fill_in 'email', with: "testemail@testserver.com"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "Not my password"
    click_on "create"
    expect(page).to have_content("Check yer passwords!")
    expect(User.count).to eq user_count
  end
  scenario 'An email should persist when passwords do not match' do
    visit '/users/new'
    fill_in 'email', with: "testemail@testserver.com"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "Not my password"
    click_on "create"
    expect(find_field('email').value).to eq "testemail@testserver.com"
  end
end
