feature "Sign_in" do 
  scenario "User signs_in" do
  	sign_up("me@test.com", "pass", "pass" )
  	visit '/users/sign_in'
  	fill_in 'email', with: 'me@test.com'
  	fill_in 'password', with: "pass"
  	click_button 'Login'
  	expect(page).to have_content "Welcome me@test"
  end
end