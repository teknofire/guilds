class TimersController < ApplicationController
  before_action :set_timer, only: %i[ show edit update destroy ]

  # GET /timers or /timers.json
  def index
    @timers = authorize policy_scope(Timer)
  end

  # GET /timers/1 or /timers/1.json
  def show
  end

  # GET /timers/new
  def new
    @timer = authorize Timer.new
    @timer.starts_at = Time.now
  end

  # GET /timers/1/edit
  def edit
  end

  # POST /timers or /timers.json
  def create
    @timer = authorize Timer.new(timer_params)

    respond_to do |format|
      if @timer.save
        format.html { redirect_to @timer, notice: "Timer was successfully created." }
        format.json { render :show, status: :created, location: @timer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @timer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timers/1 or /timers/1.json
  def update
    respond_to do |format|
      if @timer.update(timer_params)
        format.html { redirect_to @timer, notice: "Timer was successfully updated." }
        format.json { render :show, status: :ok, location: @timer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @timer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timers/1 or /timers/1.json
  def destroy
    @timer.destroy!

    respond_to do |format|
      format.html { redirect_to timers_path, status: :see_other, notice: "Timer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timer
      @timer = authorize Timer.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def timer_params
      params.expect(timer: [ :name, :starts_at, :user_id, :public, :description ])
    end
end
