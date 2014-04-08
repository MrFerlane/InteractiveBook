class ConditionsController < ApplicationController
  before_action :set_condition, only: [:show, :edit, :update, :destroy]
  before_action :get_nessesary_sources, only: [:new, :edit]

  # GET /conditions
  # GET /conditions.json
  def index
    @act = Act.where(id: params[:act_id]).first
    @conditions = Condition.where(act_id: @act.id)
  end

  # GET /conditions/1
  # GET /conditions/1.json
  def show
  end

  # GET /conditions/new
  def new
    @condition = Condition.new
  end

  # GET /conditions/1/edit
  def edit
  end

  # POST /conditions
  # POST /conditions.json
  def create
    @act = Act.where(id: params[:act_id]).first
    @condition = Condition.new(condition_params)

    respond_to do |format|
      if @condition.save
        format.html { redirect_to @condition, notice: 'Condition was successfully created.' }
        format.json { render action: 'show', status: :created, location: @condition }
      else
        format.html { render action: 'new' }
        format.json { render json: @condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conditions/1
  # PATCH/PUT /conditions/1.json
  def update
    respond_to do |format|
      if @condition.update(condition_params)
        format.html { redirect_to @condition, notice: 'Condition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conditions/1
  # DELETE /conditions/1.json
  def destroy
    @act = Act.where(id: params[:act_id]).first
    @condition.destroy
    respond_to do |format|
      format.html { redirect_to({ controller: 'conditions', action: 'index', act_id: @act.id })}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condition
      @condition = Condition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condition_params
      params.require(:condition).permit(:act_id, :source_class, :source_name, :condition_class, :value)
    end

    def get_nessesary_sources

      @item_source_names = []
      @abilities_source_names = []
      @attributes_source_names = []

      @act = Act.where(id: params[:act_id]).first
      @characters = @act.page.book.characters

      @characters.each do | character |
        items = character.items
        abilities = character.abilities
        attributes = character.attributes

        items.each do |item|
          @item_source_names << item.name
        end

        abilities.each do |ability|
          @abilities_source_names << ability.name
        end

        attributes.each do |attribute|
          @attributes_source_names << attribute.name
        end

      end

      @item_source_names.uniq!
      @abilities_source_names.uniq!
      @attributes_source_names.uniq!

      @source_classes = {"Предметы" => "items" , "Характеристики" => "attributes", "Способности" => "abilities"  }
      @condition_classes = {"меньше чем" => "lessthen", "больше чем" => "greaterthen","равно" => "equals","существует" => "exists"}
    end
end
