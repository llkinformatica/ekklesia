# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
    before_action :redirect_if_authenticated, only: [:create, :new]
    before_action :authenticate_usuario!, only: [:destroy]

    layout 'session'

    def create
      @usuario = Usuario.find_by(username: params[:usuario][:username].downcase)
      if @usuario
        if @usuario.authenticate(params[:usuario][:password])
          after_login_path = session[:usuario_return_to] || root_path
          login @usuario
          remember(@usuario) if params[:usuario][:remember_me] == "1"
          redirect_to after_login_path, notice: "Signed in."
        else
          flash.now[:alert] = "Incorrect username or password."
          render :new, status: :unprocessable_entity
        end
      else
        flash.now[:alert] = "Incorrect username or password."
        render :new, status: :unprocessable_entity
      end
    end
  
    def destroy
      forget_active_session
      logout
      redirect_to root_path, notice: "Signed out."
    end
  
    def new
    end
  
  end