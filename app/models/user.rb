require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String
  property :password_hash, Text
  attr_accessor :password_confirmation
  attr_reader :password
  

   validates_confirmation_of :password, :confirm => :password_confirmation
  # def password
  #   @password #||= Password.new(password_hash)
  # end

  def password=(new_password)
    @password = new_password
    self.password_hash = Password.create(new_password)
    #self.password_hash = @password
  end

  # def self.create_with_password(args)
  #   user = self.create(args)
  #   user.password = args[:password]
  #   user.save
  #   user
  # end
end
