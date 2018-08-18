class StatusActivitiesController < ApplicationController
  before_action :set_status_activity, only: [:show, :edit, :update, :destroy]

  # GET /status_activities
  # GET /status_activities.json
  def index
    @status_activities = StatusActivity.all
  end

  # GET /status_activities/1
  # GET /status_activities/1.json
  def show
  end

  # GET /status_activities/new
  def new
    @status_activity = StatusActivity.new
  end

  # GET /status_activities/1/edit
  def edit
  end

  # POST /status_activities
  # POST /status_activities.json
  def create
    @status_activity = StatusActivity.new(status_activity_params)

    respond_to do |format|
      if @status_activity.save
        format.html { redirect_to @status_activity, notice: 'Status activity was successfully created.' }
        format.json { render :show, status: :created, location: @status_activity }
      else
        format.html { render :new }
        format.json { render json: @status_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_activities/1
  # PATCH/PUT /status_activities/1.json
  def update
    respond_to do |format|
      if @status_activity.update(status_activity_params)
        format.html { redirect_to @status_activity, notice: 'Status activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @status_activity }
      else
        format.html { render :edit }
        format.json { render json: @status_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_activities/1
  # DELETE /status_activities/1.json
  def destroy
    @status_activity.destroy
    respond_to do |format|
      format.html { redirect_to status_activities_url, notice: 'Status activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_activity
      @status_activity = StatusActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_activity_params
      params.require(:status_activity).permit(:nombre_status_activity)
    end
end
