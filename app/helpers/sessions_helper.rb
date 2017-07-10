module SessionsHelper

def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token 
	#permanent это { value:   remember_token, expires: 20.years.from_now.utc } 
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end
  
  def signed_in?
    !current_user.nil? # ! это not
	# то есть sign_in? true когда current_user не nill
   end
  
   def current_user=(user)
    @current_user = user
  end
  
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
	# если @current_user = nil то false и выполняем после ||=
  end
  
  def sign_out
    current_user.update_attribute(:remember_token, User.encrypt(User.new_remember_token))
	cookies.delete(:remember_token)
	self.current_user = nil
  end
  
end