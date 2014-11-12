class HomeController < ApplicationController
  before_filter :getUser, :getUsername, :getUserId, :getSampleMediumId
  
  def home

  end

end
