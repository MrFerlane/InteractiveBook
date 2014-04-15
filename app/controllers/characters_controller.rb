class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_action :get_book, only: [:index, :destroy]

  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.where(book_id: params[:book_id])
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
    @character_attributes = CharacterAttribute.where(character_id: @character.id)
    @character_abilities = CharacterAbility.where(character_id: @character.id)
    @character_items = CharacterItem.where(character_id: @character.id)
  end

  # GET /characters/new
  def new
    @character = Character.new
    @book_id = params[:book_id]
  end

  # GET /characters/1/edit
  def edit
    params[:book_id] = @character.book_id
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(character_params)
    flash[:notice] = @character
    respond_to do |format|
      if @character.save
        bookAttributes = DefaultAttribute.where(book_id: @character.book_id)
        bookItems = DefaultItem.where(book_id: @character.book_id)
        bookAttributes.each do |default_attribute|
          CharacterAttribute.create(character_id: @character.id, default_attribute_id: default_attribute.id, value: 0)
        end
        bookItems.each do |default_item|
          CharacterItem.create(character_id: @character.id, default_item_id: default_item.id, value: 0)
        end
        format.html { redirect_to @character, notice: 'Character was successfully created.' }
        format.json { render action: 'show', status: :created, location: @character }
      else
        format.html { render action: 'new' }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update

    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
    CharacterAttribute.where(character_id: @character.id).destroy_all
    CharacterAbility.where(character_id: @character.id).destroy_all
    CharacterItem.where(character_id: @character.id).destroy_all
    respond_to do |format|
      format.html { redirect_to({ controller: 'characters', action: 'index', book_id: @book.id }) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def get_book
      @book = Book.where(id: params[:book_id]).first
    end

    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:book_id, :name, :description)
    end
end
