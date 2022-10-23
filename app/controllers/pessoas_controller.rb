class PessoasController < ApplicationController
  before_action :set_pessoa, only: %i[ show edit update destroy ]

  # GET /pessoas or /pessoas.json
  def index
    if params[:query].present?
      @pagy, @pessoas = pagy(current_usuario.pessoas.where("nome LIKE ? or sobrenome LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%").order(:nome))
    elsif params[:aniversariantes].present?
      @pagy, @pessoas = pagy(current_usuario.pessoas.where('DAY(data_nascimento) = ? AND MONTH(data_nascimento) = ?', Date.today.day, Date.today.month).order(:nome))
    else
      @pagy, @pessoas = pagy(current_usuario.pessoas.all.order(:nome))
    end

    if turbo_frame_request?
      render partial: "pessoas", locals: { pessoas: @pessoas}
    else
      render :index
    end

  end

  # GET /pessoas/1 or /pessoas/1.json
  def show
  end

  # GET /pessoas/new
  def new
    @pessoa = Pessoa.new
  end

  # GET /pessoas/1/edit
  def edit
  end

  # POST /pessoas or /pessoas.json
  def create
    @pessoa = Pessoa.new(pessoa_params.merge(usuario: current_usuario))

      if @pessoa.imagem.attach(pessoa_params[:imagem])     
        if @pessoa.save
          format.html { redirect_to pessoa_url(@pessoa), notice: "Pessoa criada com sucesso." }
          format.json { render :show, status: :created, location: @pessoa }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @pessoa.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end        

  end

  # PATCH/PUT /pessoas/1 or /pessoas/1.json
  def update
    respond_to do |format|
      if @pessoa.update(pessoa_params)
        format.html { redirect_to pessoa_url(@pessoa), notice: "Pessoa was successfully updated." }
        format.json { render :show, status: :ok, location: @pessoa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pessoas/1 or /pessoas/1.json
  def destroy
    @pessoa.destroy

    respond_to do |format|
      format.html { redirect_to pessoas_url, notice: "Pessoa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa
      @pessoa = current_usuario.pessoas.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pessoa_params
      params.require(:pessoa).permit(:nome, :sobrenome, :genero, :telefone, :email, :celular, :logradouro, :numero, :complemento, :bairro, :cidade, :estado, :cep, :data_nascimento, :data_falecimento, :data_batismo, :bio, :grau_parentesco, :estado_civil, :usuario_id, :imagem)
    end
end
