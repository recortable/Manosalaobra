# encoding: utf-8
class UsersController < ApplicationController
  respond_to :html, :json, :xml
  expose(:users) { User.all }
  expose(:user)
  
  def index
    respond_with users
  end
  
  def show
    respond_with user
  end

  def new
    respond_with user
  end

  def create
    flash[:notice] = "Se ha guardado! Bien!" if user.save
    respond_with user, location: users_path
  end
  
  def edit
    respond_with user
  end
  
  def update
    flash[:notice] = 'Actualizado, ¡gracias!' if user.update_attributes params[:user]
    respond_with user
  end
  
  def destroy
    flash[:notice] = 'Borrado' if user.destroy
    respond_with user, location: users_path
  end
end
