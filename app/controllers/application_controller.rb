require "app_responder"

class ApplicationController < ActionController::Base
  protect_from_forgery

  self.responder = AppResponder
  respond_to :html, :js
  responders :flash
end
