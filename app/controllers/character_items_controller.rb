class CharacterItemsController < ApplicationController
  before_action :set_character_item, only: [:show, :edit, :update, :destroy]

  # GET /character_items
  # GET /character_items.json
  def index
    @character = Character.where(id: params[:character_id])
    @character_items = CharacterItem.where(character_id: @character.id])
  end

  # GET /character_items/1
  # GET /character_items/1.json
  def show
  end

  # GET /character_items/new
  def new
    @character_item = CharacterItem.new
  end

  # GET /character_items/1/edit
  def edit
  end

  # POST /character_items
  # POST /character_items.json
  def create
    @character_item = CharacterItem.new(character_item_params)

    respond_to do |format|
      if @character_item.save
        format.html { redirect_to @character_item, notice: 'Character item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @character_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @character_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_items/1
  # PATCH/PUT /character_items/1.json
  def update
    respond_to do |format|
      if @character_item.update(character_item_params)
        format.html { redirect_to @character_item, notice: 'Character item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @character_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_items/1
  # DELETE /character_items/1.json
  def destroy
    @character_item.destroy
    respond_to do |format|
      format.html { redirect_to character_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_item
      @character_item = CharacterItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_item_params
      params.require(:character_item).permit(:character_id, :default_item_id, :value)
    end
end
