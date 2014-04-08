class DefaultAbilitiesController < ApplicationController
  before_action :set_default_ability, only: [:show, :edit, :update, :destroy]

  # GET /default_abilities
  # GET /default_abilities.json
  def index
    @book = Book.where(id: params[:book_id]).first
    @default_abilities = DefaultAbility.where(book_id: @book.id)
  end

  # GET /default_abilities/1
  # GET /default_abilities/1.json
  def show
  end

  # GET /default_abilities/new
  def new
    @book = Book.where(id: params[:book_id]).first
    @default_ability = DefaultAbility.new
  end

  # GET /default_abilities/1/edit
  def edit
    params[:book_id] = @default_ability.book_id
  end

  # POST /default_abilities
  # POST /default_abilities.json
  def create
    @default_ability = DefaultAbility.new(default_ability_params)

    respond_to do |format|
      if @default_ability.save
        format.html { redirect_to @default_ability, notice: 'Default ability was successfully created.' }
        format.json { render action: 'show', status: :created, location: @default_ability }
      else
        format.html { render action: 'new' }
        format.json { render json: @default_ability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /default_abilities/1
  # PATCH/PUT /default_abilities/1.json
  def update
    respond_to do |format|
      if @default_ability.update(default_ability_params)
        format.html { redirect_to @default_ability, notice: 'Default ability was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @default_ability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /default_abilities/1
  # DELETE /default_abilities/1.json
  def destroy
    @book = Book.where(id: params[:book_id]).first
    @default_ability.destroy
    respond_to do |format|
      format.html { redirect_to({ controller: 'default_abilities', action: 'index', book_id: @book.id }) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_default_ability
      @default_ability = DefaultAbility.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def default_ability_params
      params.require(:default_ability).permit(:book_id, :name, :description)
    end
end
