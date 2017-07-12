class UsersController < ApplicationController
  #before_action для указания конкретному методу быть вызванным до данных действий
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.paginate(page: params[:page], :per_page => 10)
  end
  
  def new
    @user = User.new
  end
    def create
	@user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
    
	def edit
	@user = User.find(params[:id])
	end
	
	def update
	@user = User.find(params[:id])
	  if @user.update_attributes(user_params)
	    flash[:success] = "Profile updated"
		redirect_to @user
	  else
	  render 'edit'
	  end
	end
	
	def destroy
	  User.find(params[:id])
	  flash[:success] = "User deleted!"
	  redirect_to users_url
	end
	
	# админ не включен в params что бы ни кто не мог передать PATH запрос на него
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
	
	
	#unless оператор если не
	def signed_in_user
	  # signed_in определен в session_controller
	  unless signed_in?
	     store_location
         flash[:warning] = "Please sign in."
         redirect_to signin_url
      end
	end
	
	def correct_user
	  @user = User.find(params[:id])
	  redirect_to(root_url) unless current_user?(@user)
    end
	
	def admin_user
	  redirect_to(root_url) unless current_user.admin?
	end
end