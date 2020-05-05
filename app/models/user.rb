class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :name, :email, :password, :password_confirmation
  validates :email , uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..20 }
  validates :password_confirmation, length: { in: 6..20 }


 
end
