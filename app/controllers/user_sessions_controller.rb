# encoding: utf-8
class UserSessionsController < ApplicationController
  expose(:user_session)

  def new
    authorize! :new, user_session
  end

  def create
    if user_session.create
      self.current_user = user_session.user
      redirect_to root_path, location: 'Bienvenidx'
    else
      flash.now.notice = "La dirección de correo electrónico o la contraseña no son correctas."
      render "new"
    end
  end

  def destroy
    self.current_user = nil
    flash[:notice] = "Adiós"
    redirect_to root_path
  end
  
  # Este método es una puerta de entrada que no está disponible en
  # producción. Se usa en los tests y en desarrollo.
  def enter
    self.current_user = User.find params[:id]
    flash[:notice] = "Hola #{current_user.name}"
    redirect_to root_path
  end

end
