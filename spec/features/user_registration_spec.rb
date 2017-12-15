feature 'Registering a user' do


	let(:user_count)  {User.count}

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

    visit '/users/new'
    fill_in 'email', with: "testemail@testserver.com"
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "Not my password"
    click_on "create"
    expect(page).to have_content("Password does not match the confirmation")
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

  scenario "Shouldn't be able to sign in with a blank email address" do
  	 visit '/users/new'
    fill_in 'password', with: "testpassword"
    fill_in 'confirm', with: "testpassword"
    click_on 'create'
    expect(page).not_to have_content("Welcome")
    expect(User.count).to eq user_count
  end
  scenario "shouldn't be able to sign in with an invalid email address" do
  	sign_up("dlfjahldksf", "pass", "pass")
  	expect(page).not_to have_content("Welcome")
    expect(User.count).to eq user_count
  end
  scenario 'User cannot sign up with an email address in use' do

    sign_up("hello@gmail.com", "password", "password")
    sign_up("hello@gmail.com", "password", "password")
    expect(page).not_to have_content("Welcome")
    expect(page).to have_content("Email address already in use!")
    expect(User.count).to eq user_count
  end
end
