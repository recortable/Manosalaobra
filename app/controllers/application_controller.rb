class ApplicationController < ActionController::Base
  protect_from_forgery

  expose(:names) { ProposedName.limit(6).order("votes_value DESC") }
  expose(:posts) { Post.limit(4).order("created_at DESC") }

  # Esto hace que 'current_user' pueda ser usado desde las vistas
  helper_method :current_user

  # Todos los métodos 'protected' pueden usarse desde los controladores
  # pero no invocarse utilizando una url (a diferencia de, por ejemplo, index)
  protected

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
