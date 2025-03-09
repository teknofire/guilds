class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]

  def index
    @users = authorize policy_scope(User)
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        # format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def set_user
    @user = authorize User.friendly.find(params[:id])
  end

  def user_params
    if policy(@user).permission?
        params.require(:user).permit(:name, :admin, :manager, :timezone, feature_ids: [])
    else
        params.require(:user).permit(:name, :timezone)
    end
  end
end
