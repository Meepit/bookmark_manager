def sign_up(email, password, confirm)
	visit '/users/new'
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'confirm', with: confirm
    click_on "create"
end
