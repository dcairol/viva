class NinosController < ApplicationController
  before_action :set_nino, only: [:show, :edit, :update, :destroy]
  before_action :set_oficinas, only: [:new,:edit,:update,:create]
  before_action :set_familias, only: [:new,:edit,:update,:create]
  before_action :set_iglesias, only: [:new,:edit,:update,:create]

  # GET /ninos
  # GET /ninos.json
  def index
    session[:search] = nil
    respond_to do |format|
      format.html{ nullify_session }
      format.json{render json: NinosDatatable.new(view_context,session)}
    end
  end

  def set_filter
    session[:ninos_filter] = params[:filter]
    respond_to do |format|
      format.html{}
      format.json{render json: {success: true}}
    end
  end

  # GET /ninos/1
  # GET /ninos/1.json
  def show
  end

  # GET /ninos/new
  def new
    @nino = Nino.new
  end

  # GET /ninos/1/edit
  def edit
  end

  # POST /ninos
  # POST /ninos.json
  def create
    @nino = Nino.new(nino_params)

    respond_to do |format|
      if @nino.save
        format.html { redirect_to ninos_path, notice: "El niño #{@nino.nombre} ha sido creado." }
        format.json { render action: 'show', status: :created, location: @nino }
      else
        format.html { render action: 'new' }
        format.json { render json: @nino.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ninos/1
  # PATCH/PUT /ninos/1.json
  def update
    respond_to do |format|
      if @nino.update(nino_params)
        format.html { redirect_to @nino, notice: "El niño #{@nino.nombre} ha sido actualizado." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @nino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ninos/1
  # DELETE /ninos/1.json
  def destroy
    @nino.destroy
    respond_to do |format|
      format.html { redirect_to ninos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nino
      @nino = Nino.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nino_params
      params.require(:nino).permit(:nombre, :fecha_nacimiento, :edad, :sexo, :fecha_ingreso, :fecha_egreso, :motivo_ingreso, :motivo_egreso, :fecha_vencimiento_medida, :oficina_id, :familia_id, :tipo_acogimiento, :iglesia_id,:grupo_hermanos,:numero_hermanos,:subvencionado,:discapacidad,:referencia,:medida_proteccion,:situacion_legal,:codigo_alternativa,:subsidio_aprobado,:fecha_medida_proteccion,:ayudas_instituciones,:tipo_discapacidad,:causa_permanencia,:escolaridad,:servicio_apoyo,:causa_egreso)
    end

    def set_iglesias
      @iglesias = Iglesia.all
    end

    def set_familias
      @familias = Familia.all
    end

    def set_oficinas
      @oficinas = Oficina.all
    end

    def nullify_session
      session[:ninos_filter] = nil
    end
end
