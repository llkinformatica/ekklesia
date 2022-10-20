class UsuariosController < ApiController

    layout 'session', only: [:new]

        def create
            @usuario = Usuario.new(usuario_params)

            if @usuario.save
                redirect_to root_path, notice: "Please check your email for confirmation instructions."
            else
                render :new, status: :unprocessable_entity
            end
        end

        def new
            @usuario = Usuario.new
        end

        def edit
            @usuario = Usuario.find(current_usuario.id)
        end

        # PATCH/PUT /grupos/1 or /grupos/1.json
        def update
            respond_to do |format|
                if current_usuario.update(usuario_params)
                    format.html { redirect_to root_url, notice: "Grupo was successfully updated." }
                else
                    format.html { render :edit, status: :unprocessable_entity }
                end
            end
        end        

        private

        def usuario_params
            params.require(:usuario).permit(:username, :password, :password_confirmation, :nome, :bio, :grupo, :imagem)
        end

end