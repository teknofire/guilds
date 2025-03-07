class RaritiesController < ApplicationController
  before_action :set_rarity, only: %i[ show edit update destroy ]

  # GET /rarities or /rarities.json
  def index
    @rarities = authorize Rarity.order(:modifier).all
  end

  # GET /rarities/1 or /rarities/1.json
  def show
  end

  # GET /rarities/new
  def new
    @rarity = authorize Rarity.new
  end

  # GET /rarities/1/edit
  def edit
  end

  # POST /rarities or /rarities.json
  def create
    @rarity = authorize Rarity.new(rarity_params)

    respond_to do |format|
      if @rarity.save
        format.html { redirect_to @rarity, notice: "Rarity was successfully created." }
        format.json { render :show, status: :created, location: @rarity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rarity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rarities/1 or /rarities/1.json
  def update
    respond_to do |format|
      if @rarity.update(rarity_params)
        format.html { redirect_to @rarity, notice: "Rarity was successfully updated." }
        format.json { render :show, status: :ok, location: @rarity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rarity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rarities/1 or /rarities/1.json
  def destroy
    @rarity.destroy!

    respond_to do |format|
      format.html { redirect_to rarities_path, status: :see_other, notice: "Rarity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rarity
      @rarity = authorize Rarity.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def rarity_params
      params.expect(rarity: [ :name, :modifier ])
    end
end
