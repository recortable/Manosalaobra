class UsersController < ApplicationController
  respond_to :html, :json, :xml
  
  def index
    @users = User.all
    respond_with @users
  end
  
  def show
    @user = User.find params[:id]
    respond_with @user
  end

  def new
    @user = User.new
    respond_with @user
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Se ha guardado! Bien!"
    end
    respond_with @user, location: users_path
  end
  
  def edit
    @user = User.find params[:id]
    respond_with @user
  end
  
  def update
    @user = User.find params[:id]
    @user.update_attributes params[:user]
    respond_with(@user)
  end
  
  def destroy
    @user = User.find params[:id]
    @user.destroy
    respond_with @user, location: users_path
  end
end
