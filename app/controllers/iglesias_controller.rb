class IglesiasController < ApplicationController
  before_action :set_iglesia, only: [:show, :edit, :update, :destroy]
  before_action :set_regiones, only: [:new,:edit,:create,:update]

  # GET /iglesia
  # GET /iglesia.json
  def index
    @iglesias = Iglesia.all
  end

  # GET /iglesia/1
  # GET /iglesia/1.json
  def show
  end

  # GET /iglesia/new
  def new
    @iglesia = Iglesia.new
  end

  # GET /iglesia/1/edit
  def edit
  end

  # POST /iglesia
  # POST /iglesia.json
  def create
    @iglesia = Iglesia.new(iglesia_params)

    respond_to do |format|
      if @iglesia.save
        format.html { redirect_to iglesias_path, notice: "La iglesia #{@iglesia.nombre} ha sido creada." }
        format.json { render action: 'show', status: :created, location: @iglesia }
      else
        format.html { render action: 'new' }
        format.json { render json: @iglesia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /iglesia/1
  # PATCH/PUT /iglesia/1.json
  def update
    respond_to do |format|
      if @iglesia.update(iglesia_params)
        format.html { redirect_to @iglesia, notice: 'La iglesia #{@iglesia.nombre} ha sido actualizada.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @iglesia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /iglesia/1
  # DELETE /iglesia/1.json
  def destroy
    @iglesia.destroy
    respond_to do |format|
      format.html { redirect_to iglesias_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_iglesia
      @iglesia = Iglesia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def iglesia_params
      params.require(:iglesia).permit(:nombre,:pastor, :coordinadores, :direccion, :compromiso_economico, :region_id, :contacto_administrativo, :telefono, :correos)
    end

    def set_regiones
      @regiones = Region.all
    end
end
