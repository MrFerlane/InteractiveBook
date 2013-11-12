class TimeControlsController < ApplicationController
  before_action :set_time_control, only: [:show, :edit, :update, :destroy]

  # GET /time_controls
  # GET /time_controls.json
  def index
    @time_controls = TimeControl.all
  end

  # GET /time_controls/1
  # GET /time_controls/1.json
  def show
  end

  # GET /time_controls/new
  def new
    @time_control = TimeControl.new
  end

  # GET /time_controls/1/edit
  def edit
  end

  # POST /time_controls
  # POST /time_controls.json
  def create
    @time_control = TimeControl.new(time_control_params)

    respond_to do |format|
      if @time_control.save
        format.html { redirect_to @time_control, notice: 'Time control was successfully created.' }
        format.json { render action: 'show', status: :created, location: @time_control }
      else
        format.html { render action: 'new' }
        format.json { render json: @time_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_controls/1
  # PATCH/PUT /time_controls/1.json
  def update
    respond_to do |format|
      if @time_control.update(time_control_params)
        format.html { redirect_to @time_control, notice: 'Time control was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @time_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_controls/1
  # DELETE /time_controls/1.json
  def destroy
    @time_control.destroy
    respond_to do |format|
      format.html { redirect_to time_controls_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_control
      @time_control = TimeControl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_control_params
      params.require(:time_control).permit(:book_id, :started_time, :end_time, :is_time_included)
    end
end
