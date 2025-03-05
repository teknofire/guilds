class ApplicationController < ActionController::Base
  stale_when_importmap_changes

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  include Pundit::Authorization
  after_action :verify_authorized

end
