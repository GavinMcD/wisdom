class UsersController < ApplicationController
  before_filter :authenticate, :except => [:new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  
  def index
    @users = User.all
    @title = "Advice Givers"
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
    @nuggets = @user.nuggets
    @nugget = Nugget.new
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
  
  private 
  
  def correct_user
    user = User.find(params[:id])
    redirect_to root_path, :notice => "You aren't the right user" unless current_user == user
  end
end
