class SessionsController < ApplicationController

  skip_before_action only: [:new, :create, :welcome]

  def new
  end

  def login
  end

  def create
    @admin = Admin.find_by(username: params[:username])
    if @admin && @admin.authenticate(params[:password])
        session[:admin_id] = @admin.id
        redirect_to '/DS11/'
    else
        redirect_to '/DS11/login', notice: "Fallo en la autenticación."
    end
  end

  def page_requires_login
  end

  def destroy
    session[:admin_id] = nil
    redirect_to '/DS11/', notice: "¡Has cerrado sesión!"
  end

end
