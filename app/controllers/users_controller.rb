class UsersController < ApplicationController
	
  before_action :signed_in_user ,only:[:index,:edit,:update]
  before_action :correct_user , only: [:edit,:update]
  before_action :admin_user, only: :destroy

def index
  @users = User.paginate(page:params[:page])
end

  def show
  		# raise params.inspect
  		@user = User.find(params[:id])
	end

	def new
  	@user = User.new
	end

  def dagtest
    
  end

	def create
		@user =User.new(user_params)
		if @user.save
      sign_in @user
			flash[ :success]= "Welcome to the sample app!"
			redirect_to @user
		else
			render 'new'
		end
	end

  def edit
  	
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  	#handle a successful update
    redirect_to @user
    sign_in(@user)
    flash[ :success]= "Profile updated"
  	else
  	render 'edit'	
  	end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
    redirect_to users_path
  end

  #This was added by me
    private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    #before filters
    def signed_in_user
    unless signed_in?
     store_location 
      redirect_to signin_path, notice: "Please sign in."
    end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user)
    end

    def admin_user
      redirect_to root_path unless current_user.admin? 
    end
end
