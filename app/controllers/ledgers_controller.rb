class LedgersController < ApplicationController
  before_action :set_player, only: %i[ deposit withdraw ]
  before_action :set_ledger, only: %i[ show edit update destroy ]

  # GET /ledgers or /ledgers.json
  def index
    @ledgers = authorize Ledger.order(updated_at: :desc).all
  end

  # GET /ledgers/1 or /ledgers/1.json
  def show
  end

  # GET /ledgers/new
  def new
    @ledger = authorize Ledger.new
  end

  # GET /ledgers/1/edit
  def edit
  end

  def deposit
    if @player
      @ledger = authorize Ledger.new(player: @player, action: "deposit")
    else
      @ledger = authorize Ledger.new(action: "deposit")
    end
    render :new
  end

  def withdraw
    if @player
      @ledger = authorize Ledger.new(player: @player, action: "withdraw")
    else
      @ledger = authorize Ledger.new(action: "withdraw")
    end
    render :new
  end

  # POST /ledgers or /ledgers.json
  def create
    @ledger = authorize Ledger.new(ledger_params)

    respond_to do |format|
      if @ledger.save
        format.html { redirect_to player_path(@ledger.player), notice: "Ledger was successfully created." }
        format.json { render :show, status: :created, location: @ledger }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ledger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ledgers/1 or /ledgers/1.json
  def update
    respond_to do |format|
      if @ledger.update(ledger_params)
        format.html { redirect_to @ledger, notice: "Ledger was successfully updated." }
        format.json { render :show, status: :ok, location: @ledger }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ledger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ledgers/1 or /ledgers/1.json
  def destroy
    @ledger.destroy!

    respond_to do |format|
      format.html { redirect_to ledgers_path, status: :see_other, notice: "Ledger was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ledger
      @ledger = authorize Ledger.find(params.expect(:id))
    end

    def set_player
      @player = Player.friendly.find(params[:player_id]) if params.key?(:player_id)
    end

    # Only allow a list of trusted parameters through.
    def ledger_params
      params.expect(ledger: [ :player_id, :item_id, :qty, :rarity_id, :action ])
    end
end
