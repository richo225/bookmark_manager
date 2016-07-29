require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email, String
  property :password_digest, String, length: 60
  attr_accessor :password_confirmation
  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password

end
