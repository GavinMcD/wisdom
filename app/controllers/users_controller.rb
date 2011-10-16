class UsersController < ApplicationController
  def index
    @users = User.all
    @title = "All wisdom givers"
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), :notice => "You're now signed up!"
    else
      render 'new'
    end 
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])
    @title = "Edit User"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :success => "Your information is now updated."
    else
      @title = 'Edit User'
      render 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :success => "The user was deleted"
  end
end
