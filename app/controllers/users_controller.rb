# encoding: utf-8
class UsersController < ApplicationController
  before_filter :require_user
  respond_to :html, :json, :xml
  expose(:users) { User.all }
  expose(:user)

  def index
    authorize! :view, User
    respond_with users
  end

  def show
    authorize! :view, User
    respond_with user
  end

  def new
    authorize! :create, User
    respond_with user
  end

  def create
    authorize! :create, User
    flash[:notice] = "Se ha guardado! Bien!" if user.save
    respond_with user, location: users_path
  end

  def edit
    authorize! :edit, User
    respond_with user
  end

  def update
    authorize! :edit, User
    if params[:user][:role]
      user.update_attribute(:role, params[:user][:role])
    else
      flash[:notice] = 'Actualizado, ¡gracias!' if user.update_attributes params[:user]
    end    
    respond_with user
  end

  def destroy
    authorize! :delete, User
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
