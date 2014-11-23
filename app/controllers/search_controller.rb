class SearchController < ApplicationController
  protect_from_forgery :except => :create 
  
  def create
    kind = params[:kind]
    title = params[:title]
    recent = params[:recent]

    content = Medium.all
    
    content = content.withKind kind if kind
    content = content.withTitleMatching title if title
    content = content.uploadedRecently if recent
    
    render json: content.as_json, status: 200
  end

end
