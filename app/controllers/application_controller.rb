class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :signed_in?

  def signed_in?
    if session[:usuario_id]
      current_user
    else
      flash[:warning] = 'Debe iniciar sesion'
      redirect_to new_session_path and return
      false
    end
  end

  def current_user
    @current_user ||= Usuario.find(session[:usuario_id])
  end

end
