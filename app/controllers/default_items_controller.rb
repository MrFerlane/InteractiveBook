class DefaultItemsController < ApplicationController
  before_action :set_default_item, only: [:show, :edit, :update, :destroy]
  before_action :get_book, only: [:index, :new, :destroy]

  # GET /default_items
  # GET /default_items.json
  def index
    @default_items = DefaultItem.where(book_id: @book.id)
  end

  # GET /default_items/1
  # GET /default_items/1.json
  def show
  end

  # GET /default_items/new
  def new
    @default_item = DefaultItem.new
  end

  # GET /default_items/1/edit
  def edit
    params[:book_id] = @default_item.book_id
  end

  # POST /default_items
  # POST /default_items.json
  def create
    @default_item = DefaultItem.new(default_item_params)

    respond_to do |format|
      if @default_item.save
        bookCharacters = Character.where(book_id: @default_item.book_id)
        bookCharacters.each do |character|
          CharacterItem.create(character_id: character.id, default_item_id: @default_item.id, value: 0)
        end
        format.html { redirect_to @default_item, notice: 'Default item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @default_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @default_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /default_items/1
  # PATCH/PUT /default_items/1.json
  def update
    respond_to do |format|
      if @default_item.update(default_item_params)
        format.html { redirect_to @default_item, notice: 'Default item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @default_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /default_items/1
  # DELETE /default_items/1.json
  def destroy
    @default_item.destroy
    CharacterItem.where(default_item_id: @default_item.id).destroy_all
    respond_to do |format|
      format.html { redirect_to({ controller: 'default_items', action: 'index', book_id: @book.id }) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def get_book
      @book = Book.where(id: params[:book_id]).first
    end

    def set_default_item
      @default_item = DefaultItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def default_item_params
      params.require(:default_item).permit(:book_id, :name, :description)
    end
end
