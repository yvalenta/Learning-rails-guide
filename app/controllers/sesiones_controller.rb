class SesionesController < ApplicationController
  skip_before_action :signed_in?

  def new

  end

  def create
    @usuario = Usuario.authenticate(params[:correo], params[:clave])
    if @usuario
      session[:usuario_id] = @usuario.id
      flash[:notice] = "Bienvenido #{@usuario.nombre}!!"
      redirect_to clientes_path
    else
      flash[:warning] = 'Los datos son erroneos!!'
      redirect_to new_sesion_path
    end
  end

  def destroy
    session[:usuario_id] = nil
    flash[:notice] = 'Sesion cerrada'
    redirect_to new_sesion_path
  end

end
