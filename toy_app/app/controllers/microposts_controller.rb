class MicropostsController < ApplicationController
  def index
    @microposts = Micropost.all
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.save
      flash[:mess] = "User created!"
      redirect_to controller: 'microposts', action: :index
      # redirect_to micropost_path(@micropost)
      # redirect_to :back
      # redirect_to :controller => 'microposts', :action => 'index'
    else
      render :new
    end
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update(micropost_params)
      flash[:mess] = "User updated!"
      redirect_to controller: 'microposts', action: :index
    else
      render :edit
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_to controller: 'microposts', action: :index
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :user_id)
  end
end
