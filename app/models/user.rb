require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String
  property :password, String
  attr_accessor :password_confirmation
  

   validates_confirmation_of :password
  # def password
  #   @password #||= Password.new(password_hash)
  # end

  def password=(new_password)
    @password = Password.create(new_password)
    #self.password_hash = @password
  end

  # def self.create_with_password(args)
  #   user = self.create(args)
  #   user.password = args[:password]
  #   user.save
  #   user
  # end
end
