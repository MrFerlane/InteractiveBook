class ChangesController < ApplicationController
  before_action :set_change, only: [:show, :edit, :update, :destroy]

  # GET /changes
  # GET /changes.json
  def index
    @act = Act.where(id: params[:act_id]).first
    @changes = Change.where(act_id: @act.id)
  end

  # GET /changes/1
  # GET /changes/1.json
  def show
  end

  # GET /changes/new
  def new
    @act = Act.where(id: params[:act_id]).first
    @change = Change.new
  end

  # GET /changes/1/edit
  def edit
    @act = Act.where(id: params[:act_id]).first
  end

  # POST /changes
  # POST /changes.json
  def create
    @act = Act.where(id: params[:act_id]).first
    @change = Change.new(change_params)

    respond_to do |format|
      if @change.save
        format.html { redirect_to @change, notice: 'Change was successfully created.' }
        format.json { render action: 'show', status: :created, location: @change }
      else
        format.html { render action: 'new' }
        format.json { render json: @change.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /changes/1
  # PATCH/PUT /changes/1.json
  def update
    respond_to do |format|
      if @change.update(change_params)
        format.html { redirect_to @change, notice: 'Change was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @change.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /changes/1
  # DELETE /changes/1.json
  def destroy
    @act = Act.where(id: params[:act_id]).first
    @change.destroy
    respond_to do |format|
      format.html { redirect_to({ controller: 'changes', action: 'index', act_id: @act.id })}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_change
      @change = Change.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def change_params
      params.require(:change).permit(:act_id, :source_class, :source_id, :change_class, :change_way, :value)
    end
end
