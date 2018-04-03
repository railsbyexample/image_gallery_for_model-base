require 'application_responder'

##
# Base controller for application
class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :json

  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :json_request?

  def json_request?
    request.format.json?
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to root_url, notice: exception.message }
    end
  end
end
