class User < ApplicationRecord
  validates_presence_of :name, :password, :password_confirmation
  validates_uniqueness_of :name

  before_save :encrypt_password

  validates_confirmation_of :password

  def encrypt_password 
    self.salt = rand.to_s unless self.salt
    self.password = Digest::SHA1.hexdigest(self.password + self.salt + 'abcdefg')
  end
end
