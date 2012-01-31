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

  # Este método es una puerta de entrada que eliminaremos
  # cuando implementemos el inicio de sesión como dios manda
  # Mira el fichero routes.rb para saber de dónde sale el params[:id]
  def enter
    self.current_user = User.find params[:id]
    flash[:notice] = "Hola #{current_user.name}"
    redirect_to root_path
  end
end
