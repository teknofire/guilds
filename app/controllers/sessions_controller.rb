class SessionsController < ApplicationController
  skip_after_action :verify_authorized

  def new
  end

  def create
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    if user.timezone.blank?
      edit_user_path(resource_or_scopea)
    else
      stored_location_for(resource_or_scope) || root_path
    end
  end
end
