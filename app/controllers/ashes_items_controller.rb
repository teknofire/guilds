class AshesItemsController < ApplicationController
  include Pagy::Backend

  before_action :set_ashes_item, only: %i[ show edit update destroy import ]

  # GET /ashes_items or /ashes_items.json
  def index
    @search = authorize AshesItem.order(Arel.sql("data->>'itemName'"))
    if params[:type] && AshesItem.inventoryFilterTypes.include?(params[:type])
      @search = @search.where("data->>'inventoryFilterType' = ?", params[:type])
    end
    if !params[:search]&.empty?
      @search = @search.where("data->>'itemName' ILIKE ?", "%#{params[:search]}%").or(
        @search.where("data->>'description' ILIKE ?", "%#{params[:search]}%")
      ).or(
        @search.where("data->>'professionTag' ILIKE ?", "%#{params[:search]}%")
      )
    end
    @pagy, @ashes_items = pagy_arel(@search)
  end

  def import 
    if @ashes_item.item.nil?
      if @item = Item.create(name: @ashes_item.data["itemName"], source: @ashes_item)
        respond_to do |format|
          if @item.save
            format.html { redirect_to edit_item_path(@item), notice: "Ashes item was successfully imported." }
            format.json { render :show, status: :created, location: @item }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @item.errors, status: :unprocessable_entity }
          end
        end

      end
    end
  end

  # GET /ashes_items/1 or /ashes_items/1.json
  def show
  end

  # GET /ashes_items/new
  def new
    @ashes_item = authorize AshesItem.new
  end

  # GET /ashes_items/1/edit
  def edit
  end

  # POST /ashes_items or /ashes_items.json
  def create
    @ashes_item = authorize AshesItem.new(ashes_item_params)

    respond_to do |format|
      if @ashes_item.save
        format.html { redirect_to @ashes_item, notice: "Ashes item was successfully created." }
        format.json { render :show, status: :created, location: @ashes_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ashes_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ashes_items/1 or /ashes_items/1.json
  def update
    respond_to do |format|
      if @ashes_item.update(ashes_item_params)
        format.html { redirect_to @ashes_item, notice: "Ashes item was successfully updated." }
        format.json { render :show, status: :ok, location: @ashes_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ashes_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ashes_items/1 or /ashes_items/1.json
  def destroy
    @ashes_item.destroy!

    respond_to do |format|
      format.html { redirect_to ashes_items_path, status: :see_other, notice: "Ashes item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ashes_item
      @ashes_item = authorize AshesItem.friendly.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def ashes_item_params
      params.expect(ashes_item: [ :guid, :data ])
    end
end
