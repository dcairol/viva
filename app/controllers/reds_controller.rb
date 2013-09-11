class RedsController < ApplicationController
  before_action :set_red, only: [:show, :edit, :update, :destroy]
  before_action :set_regiones, only: [:new, :edit, :create, :update]

  # GET /reds
  # GET /reds.json
  def index
    @reds = Red.all
  end

  # GET /reds/1
  # GET /reds/1.json
  def show
  end

  # GET /reds/new
  def new
    @red = Red.new
  end

  # GET /reds/1/edit
  def edit
  end

  # POST /reds
  # POST /reds.json
  def create
    @red = Red.new(red_params)

    respond_to do |format|
      if @red.save
        format.html { redirect_to reds_path, notice: "La red #{@red.nombre} ha sido creada." }
        format.json { render action: 'show', status: :created, location: @red }
      else
        format.html { render action: 'new' }
        format.json { render json: @red.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reds/1
  # PATCH/PUT /reds/1.json
  def update
    respond_to do |format|
      if @red.update(red_params)
        format.html { redirect_to @red, notice: "La red #{@red.nombre} ha sido actualizada." }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @red.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reds/1
  # DELETE /reds/1.json
  def destroy
    @red.destroy
    respond_to do |format|
      format.html { redirect_to reds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_red
      @red = Red.find(params[:id])
    end

    def set_regiones
      @regiones = Region.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def red_params
      params.require(:red).permit(:nombre,:region_id, :fecha_nacimiento, :telefono, :direccion, :servicio, :condiciones)
    end
end
