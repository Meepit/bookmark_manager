
describe User do
	subject {User.create(email: "test@test.net", password: "password", password_confirmation: "password")}
  describe "#authenticate" do
  	it "checks the password" do
  	  expect(subject.authenticate("password")).to eq true
  	end
  end
end