class User < ApplicationRecord
has_many :microposts, dependent: :destroy
#attr_accessible :name, :email, :password, :password_confirmation
#attr_accessor :remember_token
before_save { self.email = email.downcase } #адреса в нижний регистр
before_create :create_remember_token
validates :name, presence: true, length:{ maximum: 50 }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
# VALID_EMAIL_REGEX регулярное выражение нлайн редактор регулярных выражений Rubular
#uniqueness: { case_sensitive: false }плюем на регистр
validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false } 
has_secure_password
validates :password, length: { minimum: 6 }
has_many :microposts

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # Это предварительное решение. См. полную реализацию в "Following users".
  def feed
    Micropost.where("user_id = ?", id)
  end
  
  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

#  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
	
end
