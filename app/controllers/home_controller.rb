class HomeController < ApplicationController
  skip_before_action :authenticate_admin!  # Public page, no login needed
  
  def index
  end
end
