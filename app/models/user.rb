require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String
  #property :password, String

  def password
    @password #||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    #self.password_hash = @password
  end

  def self.create_with_password(email, password)
    user = self.create(email: email)
    user.password = password
    user.save
    user
  end
end
