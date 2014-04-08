class DefaultAttributesController < ApplicationController
  before_action :set_default_attribute, only: [:show, :edit, :update, :destroy]

  # GET /default_attributes
  # GET /default_attributes.json
  def index
    @book = Book.where(id: params[:book_id]).first
    @default_attributes = DefaultAttribute.where(book_id: @book.id)
  end

  # GET /default_attributes/1
  # GET /default_attributes/1.json
  def show
  end

  # GET /default_attributes/new
  def new
    @book = Book.where(id: params[:book_id]).first
    @default_attribute = DefaultAttribute.new
  end

  # GET /default_attributes/1/edit
  def edit
    params[:book_id] = @default_attribute.book_id
  end

  # POST /default_attributes
  # POST /default_attributes.json
  def create
    @default_attribute = DefaultAttribute.new(default_attribute_params)

    respond_to do |format|
      if @default_attribute.save
        format.html { redirect_to @default_attribute, notice: 'Default attribute was successfully created.' }
        format.json { render action: 'show', status: :created, location: @default_attribute }
      else
        format.html { render action: 'new' }
        format.json { render json: @default_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /default_attributes/1
  # PATCH/PUT /default_attributes/1.json
  def update
    respond_to do |format|
      if @default_attribute.update(default_attribute_params)
        format.html { redirect_to @default_attribute, notice: 'Default attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @default_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /default_attributes/1
  # DELETE /default_attributes/1.json
  def destroy
    @book = Book.where(id: params[:book_id]).first
    @default_attribute.destroy
    respond_to do |format|
      format.html { redirect_to({ controller: 'default_attributes', action: 'index', book_id: @book.id }) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_default_attribute
      @default_attribute = DefaultAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def default_attribute_params
      params.require(:default_attribute).permit(:book_id, :name, :description)
    end
end
