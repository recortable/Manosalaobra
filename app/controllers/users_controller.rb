# encoding: utf-8
class UsersController < ApplicationController
  before_filter :require_user, except: [:subscribe ]
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

  def subscribe
    notice = 'Tienes que introducir tu email'
    if params[:email].present?
      user = User.new email: params[:email]
      notice = 'Te mantendremos informadx' if user.save(validate: false)
    end
    redirect_to params[:from_url], notice: notice
  end

end
