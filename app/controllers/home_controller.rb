##
# Controller for static sites
class HomeController < ApplicationController
  # GET /
  def index
    if user_signed_in?
      redirect_to user_properties_url(current_user)
    else
      redirect_to home_url
    end
  end

  # GET /home
  def show; end
end
