class UsersController < ApplicationController
  
  def show
    user = User.find_by_id params[:id]

    unless user.nil?
      render json: cleanUser(user)
    else
      render status: 404, text: "User not found"
    end
  end


  def cleanUser user
    user.as_json except: [:created_at, :updated_at]
  end

end
