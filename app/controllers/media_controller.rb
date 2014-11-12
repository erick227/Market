class MediaController < ApplicationController
  before_filter :getUser, :userPermission?

  #show all media
  def index
    user_id = params[:user_id]

    media = Medium.all
    media = User.find(user_id).media if user_id

    render json: media.as_json
  end

  #show single medium
  def show 
    user_id = params[:user_id]
    medium_id = params[:id]
    
    media = user_id ? User.find(user_id).media : Medium.all
    medium = media.find_by_id medium_id
    
    unless medium.nil?
      render json: medium.as_json
    else
      render status: 404, text: "Medium not found"
    end
  end

  #adds media
  def create
    user = User.find_by_id params[:user_id]

    if user
      media = Medium.create media_params
      render json: media.as_json, status: 200
    else
      render status: 403, text: "Media needs to have a User"
    end
  end

  def update
    puts "hello"
  end

  def destroy
    media = Medium.find_by_id params[:id]

    if media
      render json: media.as_json, status: 200
      media.destroy
    else
      render status: 404, text: "Media not found"
    end
  end


  private
  def media_params
    params.permit(:user_id, :title, :author, :secondary_info, :kind)
  end

  def userPermission?
    puts params[:user_id] == @user.id
    #TODO: deny in some way
  end
end
