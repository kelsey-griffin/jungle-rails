class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :name, :email, :password, :password_confirmation
  validates :email , uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..20 }
  validates :password_confirmation, length: { in: 6..20 }

  def self.authenticate_with_credentials(email, password)

    # Clean user input
    email_clean = email.downcase.strip
    
    user = User.find_by_email(email_clean)
    
    if user && user.authenticate(password)
      @user = user
    else 
      nil
    end

  end
 
end
