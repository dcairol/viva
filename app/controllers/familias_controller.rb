class FamiliasController < ApplicationController
  before_action :set_familia, only: [:show, :edit, :update, :destroy]
  before_action :set_iglesias, only: [:new,:edit]

  # GET /familia
  # GET /familia.json
  def index
    @familias = Familia.all
  end

  # GET /familia/1
  # GET /familia/1.json
  def show
  end

  # GET /familia/new
  def new
    @familia = Familia.new
  end

  # GET /familia/1/edit
  def edit
  end

  # POST /familia
  # POST /familia.json
  def create
    @familia = Familia.new(familia_params)

    respond_to do |format|
      if @familia.save
        format.html { redirect_to familias_path, notice: "La familia #{@familia.nombre} ha sido creada." }
        format.json { render action: 'show', status: :created, location: @familia }
      else
        format.html { render action: 'new' }
        format.json { render json: @familia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /familia/1
  # PATCH/PUT /familia/1.json
  def update
    respond_to do |format|
      if @familia.update(familia_params)
        format.html { redirect_to @familia, notice: "La familia #{@familia.nombre} ha sido actualizada." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @familia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /familia/1
  # DELETE /familia/1.json
  def destroy
    @familia.destroy
    respond_to do |format|
      format.html { redirect_to familias_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_familia
      @familia = Familia.find(params[:id])
    end

    def set_iglesias
      @iglesias = Iglesia.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def familia_params
      params.require(:familia).permit(:nombre, :grupo, :telefonos, :correo, :direccion, :aval, :iglesia_id, :tipo_acogimiento, :perfil)
    end
end
