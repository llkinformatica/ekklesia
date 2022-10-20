class ApplicationController < ActionController::Base
    include Authentication
    before_action :authenticate_usuario!
    include Pagy::Backend
end
