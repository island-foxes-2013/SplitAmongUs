require "app_responder"

class ApplicationController < ActionController::Base
  protect_from_forgery

  self.responder = AppResponder
  respond_to :html, :js
  responders :flash

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end
end
