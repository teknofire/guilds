class MembersController < ApplicationController
  before_action :set_team
  before_action :set_member, only: %i[ edit update destroy ]

  # GET /members/new
  def new
    @member = authorize @team.members.build
    @available = User.not_in_team(@team)
  end

  # GET /members/1/edit
  def edit
    @available = User.not_in_team(@team)
  end

  # POST /members or /members.json
  def create
    @member = authorize @team.members.build(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @team, notice: "Member was successfully created." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @team, notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy!

    respond_to do |format|
      format.html { redirect_to @team, status: :see_other, notice: "Member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = authorize @team.members.find(params.expect(:id))
    end

    def set_team
      @team = authorize Team.friendly.find(params.expect(:team_id))
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.expect(member: [ :user_id ])
    end
end
