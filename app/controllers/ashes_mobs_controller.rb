class AshesMobsController < ApplicationController
  include Pagy::Backend

  before_action :set_ashes_mob, only: %i[ show edit update destroy ]

  # GET /ashes_mobs or /ashes_mobs.json
  def index
    @search = authorize AshesMob.order(Arel.sql("data->>'_displayName'"))
    if !params[:search]&.empty?
      @search = @search.where("data->>'_displayName' ILIKE ?", "%#{params[:search]}%")
    end

    @pagy, @ashes_mobs = pagy_arel(@search)
  end

  # GET /ashes_mobs/1 or /ashes_mobs/1.json
  def show
  end

  # GET /ashes_mobs/new
  def new
    @ashes_mob = authorize AshesMob.new
  end

  # GET /ashes_mobs/1/edit
  def edit
  end

  # POST /ashes_mobs or /ashes_mobs.json
  def create
    @ashes_mob = authorize AshesMob.new(ashes_mob_params)

    respond_to do |format|
      if @ashes_mob.save
        format.html { redirect_to @ashes_mob, notice: "Ashes mob was successfully created." }
        format.json { render :show, status: :created, location: @ashes_mob }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ashes_mob.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ashes_mobs/1 or /ashes_mobs/1.json
  def update
    respond_to do |format|
      if @ashes_mob.update(ashes_mob_params)
        format.html { redirect_to @ashes_mob, notice: "Ashes mob was successfully updated." }
        format.json { render :show, status: :ok, location: @ashes_mob }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ashes_mob.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ashes_mobs/1 or /ashes_mobs/1.json
  def destroy
    @ashes_mob.destroy!

    respond_to do |format|
      format.html { redirect_to ashes_mobs_path, status: :see_other, notice: "Ashes mob was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ashes_mob
      @ashes_mob = authorize AshesMob.friendly.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def ashes_mob_params
      params.expect(ashes_mob: [ :guid, :data ])
    end
end
