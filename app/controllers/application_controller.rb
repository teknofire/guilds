class ApplicationController < ActionController::Base
  stale_when_importmap_changes

  around_action :set_timezone, if: :user_has_timezone?

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  include Pundit::Authorization
  after_action :verify_authorized

rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def user_has_timezone?
    current_user && current_user.timezone.present?
  end

  def set_timezone(&block)
    Time.use_zone(current_user.timezone, &block)
  end
end
