# app/controllers/concerns/authentication.rb
module Authentication
    extend ActiveSupport::Concern
  
    included do
      before_action :current_usuario
      helper_method :current_usuario
      helper_method :usuario_signed_in?
    end
  
    def login(usuario)
      reset_session
      session[:current_usuario_id] = usuario.id
    end
  
    def logout
      reset_session
    end
  
    def redirect_if_authenticated
      redirect_to root_path, alert: "You are already logged in." if usuario_signed_in?
    end
  
    def forget_active_session
      cookies.delete :remember_token
    end
  
    def authenticate_usuario!
      redirect_to login_path, alert: "You need to login to access that page." unless usuario_signed_in?
    end  
  
    private
  
    def current_usuario
      Current.usuario ||= session[:current_usuario_id] && Usuario.find_by(id: session[:current_usuario_id])
    end
  
    def usuario_signed_in?
      Current.usuario.present?
    end
  
  end