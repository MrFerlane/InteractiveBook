class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.where(book_id: params[:book_id])
    @book = Book.where(id: params[:book_id]).first
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @book = Book.where(id: @page.book_id).first
  end

  # GET /pages/new
  def new
    @page = Page.new
    @book = Book.where(id: params[:book_id]).first
  end

  # GET /pages/1/edit
  def edit
    @book = Book.where(id: @page.book_id).first
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if Page.where(book_id: page_params[:book_id], number: page_params[:number]).blank?
        if @page.save
          format.html { redirect_to @page, notice: 'Page was successfully created.' }
          format.json { render action: 'show', status: :created, location: @page }
        else
          format.html { render action: 'new' }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to({controller: 'pages', action: 'new', book_id: page_params[:book_id]}, notice: "Страница с таким номером уже существует для книги")}
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @book = Book.where(id: params[:book_id]).first
    @page.destroy
    respond_to do |format|
      format.html { redirect_to({ controller: 'pages', action: 'index', book_id: @book.id })}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:book_id, :number, :text)
    end
end
