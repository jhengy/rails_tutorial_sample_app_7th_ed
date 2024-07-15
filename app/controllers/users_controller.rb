class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # debugger
  end

  # GET /users/new or GET /signup
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      # assign flash hash with :success message, corresponding view to be rendered by application.html.erb
      flash[:success] = "Welcome to the Sample App!"
      # equivalent to redirect_to(user_url(@user))
      redirect_to @user
    else
      # render new partial view
      render 'new', status: :unprocessable_entity
    end
  end

  private
    # auxiliary method to retrieve restricted user params to avoid mass assignment vulnerability
    # analagous to params[:user] after verifying presence of :user and the list of attributes
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
