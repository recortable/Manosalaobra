class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale_from_user_prefs
  before_filter :set_locale_from_url

  expose(:posts) { Post.limit(4) }

  # Esto hace que 'current_user' pueda ser usado desde las vistas
  helper_method :current_user
  helper_method :current_locale

  protected
  
  VALID_LOCALES = ['es', 'ca']
  def set_locale_from_user_prefs
    locale = params[:locale]
    if !(locale.present? and VALID_LOCALES.include?(locale))
      location = request.fullpath
      locale = request.compatible_language_from(VALID_LOCALES) || I18n.default_locale
      location = '/' + locale.to_s + location
      redirect_to location
    end
  end

  def current_locale
    @current_locale = I18n.locale
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = 'Es necesario que te identifiques primero.'
      redirect_to login_path(from: request.fullpath)
    end
  end

  def store_location(location = nil)
    location ||= request.fullpath
    session[:return_to] = location
  end

  # Este método devuelve el usuario de la sessión (si existe)
  def current_user
    if session[:user_id].present?
      User.find session[:user_id]
    else
      nil
    end
  end

  # Este método guarda el usuario en la sessión
  # Si el parámetro user es nulo (nil) entonces se elimina el usuario de la sesión
  def current_user=(user)
    if user.present?
      session[:user_id] = user.id
    else
      session[:user_id] = nil
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = "Acceso denegado"
    redirect_to root_url
  end

end
