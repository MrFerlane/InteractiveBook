class ActsController < ApplicationController
  before_action :set_act, only: [:show, :edit, :update, :destroy]

  # GET /acts
  # GET /acts.json
  def index
    @page = Page.where(id: params[:page_id]).first
    @acts = Act.where(page_id: @page.id)
    @book = Book.where(id: @page.book_id).first
  end

  # GET /acts/1
  # GET /acts/1.json
  def show
    @page = Page.where(id: params[:page_id]).first
  end

  # GET /acts/new
  def new
    @act = Act.new
    @page = Page.where(id: params[:page_id]).first
    @all_book_pages=Page.where(book_id: @page.book_id)
  end

  # GET /acts/1/edit
  def edit
    @page = Page.where(id: params[:page_id]).first
    @all_book_pages=Page.where(book_id: @page.book_id)
  end

  # POST /acts
  # POST /acts.json
  def create
    @act = Act.new(act_params)

    respond_to do |format|
      if @act.save
        format.html { redirect_to @act, notice: 'Act was successfully created.' }
        format.json { render action: 'show', status: :created, location: @act }
      else
        format.html { render action: 'new' }
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acts/1
  # PATCH/PUT /acts/1.json
  def update
    respond_to do |format|
      if @act.update(act_params)
        format.html { redirect_to @act, notice: 'Act was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acts/1
  # DELETE /acts/1.json
  def destroy
    @page = Page.where(id: params[:page_id]).first
    @act.destroy
    respond_to do |format|
      format.html { redirect_to({ controller: 'acts', action: 'index', page_id: @page.id })}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_act
      @act = Act.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def act_params
      params.require(:act).permit(:page_id, :description, :success_page, :fail_page, :time_fail_page, :required_time)
    end
end
