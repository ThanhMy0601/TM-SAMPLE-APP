class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # @user = User.create(user_params)
    # redirect_to user_path(@user)

    @user = User.new(user_params)
    if @user.save
      # redirect_to user_path(@user)
      # redirect_to :back
      flash[:mess] = "User created!"
      redirect_to :controller => 'users', :action => 'index'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    # @user.update
    # redirect_to user_path(@user)
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:mess] = "User updated!"
      redirect_to :controller => 'users', :action => 'index'
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :controller => 'users', :action => 'index'
  end

# ADD IN A PRIVATE METHOD FOR USER_PARAMS

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
