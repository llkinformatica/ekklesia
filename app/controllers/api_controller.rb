class ApiController < ApplicationController

    skip_before_action :authenticate_usuario!

    def encode_token(payload)
        JWT.encode(payload,'secret')
    end

    def decode_token
        auth_token = request.headers['Authorization']
        if auth_token
            token=auth_token.split(' ').last
            begin
                JWT.decode(token,'secret', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def usuario_autorizado
        decoded_token = decode_token()
        if decoded_token
            usuario_id = decoded_token[0]['usuario_id']
            @usuario = Usuario.find_by(id: usuario_id)
        end
    end

    def autorizar
        render json: { message: 'Você precisa estar logado'}, status: :unauthorized unless usuario_autorizado
    end    
end