class WelcomeController < ApplicationController
  def index
    authorize :welcome

    if signed_in? && current_user.timezone.blank?
      flash[:warn] = "Please set your timezone."
      redirect_to edit_user_path(current_user)
    end
  end
end
