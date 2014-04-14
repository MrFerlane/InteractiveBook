class CharacterItemsController < ApplicationController
  before_action :set_character_item, only: [:show, :edit, :update, :destroy]
  before_action :get_character, only: [:index, :new, :edit, :destroy]

  # GET /character_items
  # GET /character_items.json
  def index
    @character_items = CharacterItem.where(character_id: @character.id)
  end

  # GET /character_items/1
  # GET /character_items/1.json
  def show
  end

  # GET /character_items/new
  def new
    @character_item = CharacterItem.new
    @book_default_items = DefaultItem.where(book_id: @character.book_id )
  end

  # GET /character_items/1/edit
  def edit
    @book_default_items = DefaultItem.where(book_id: @character.book_id )
  end

  def create
  end

  # PATCH/PUT /character_items/1
  # PATCH/PUT /character_items/1.json
  def update
    @character = Character.where(id: params[:character_id]).first
    respond_to do |format|
      if @character_item.update(character_item_params)
        format.html { redirect_to @character_item, notice: 'Character item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit', character_id: @character_item.character_id }
        format.json { render json: @character_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_items/1
  # DELETE /character_items/1.json
  def destroy
    @character_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_character
      @character = Character.where(id: params[:character_id]).first
    end

    def set_character_item
      @character_item = CharacterItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_item_params
      params.require(:character_item).permit(:character_id, :default_item_id, :value)
    end
end
