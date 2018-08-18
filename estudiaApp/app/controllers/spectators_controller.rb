class SpectatorsController < ApplicationController
  before_action :set_spectator, only: [:show, :edit, :update, :destroy]

  # GET /spectators
  # GET /spectators.json
  def index
    @spectators = Spectator.all
  end

  # GET /spectators/1
  # GET /spectators/1.json
  def show
  end

  # GET /spectators/new
  def new
    @spectator = Spectator.new
  end

  # GET /spectators/1/edit
  def edit
  end

  # POST /spectators
  # POST /spectators.json
  def create
    @spectator = Spectator.new(spectator_params)

    respond_to do |format|
      if @spectator.save
        format.html { redirect_to @spectator, notice: 'Spectator was successfully created.' }
        format.json { render :show, status: :created, location: @spectator }
      else
        format.html { render :new }
        format.json { render json: @spectator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spectators/1
  # PATCH/PUT /spectators/1.json
  def update
    respond_to do |format|
      if @spectator.update(spectator_params)
        format.html { redirect_to @spectator, notice: 'Spectator was successfully updated.' }
        format.json { render :show, status: :ok, location: @spectator }
      else
        format.html { render :edit }
        format.json { render json: @spectator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spectators/1
  # DELETE /spectators/1.json
  def destroy
    @spectator.destroy
    respond_to do |format|
      format.html { redirect_to spectators_url, notice: 'Spectator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spectator
      @spectator = Spectator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spectator_params
      params.require(:spectator).permit(:nombre_spectator)
    end
end
