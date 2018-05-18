##
# Controller for static sites
class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to user_properties_url(current_user)
    else
      redirect_to home_url
    end
  end

  def show; end
end
