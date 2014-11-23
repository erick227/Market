class TagsController < ApplicationController

  def index
    render status: 200, json: Tag.all.pluck(:name)
  end


  def show
    name = params[:id]
    tag = Tag.find_by(name: name)

    if tag
      render status: 200, json: tag.to_json(include: [:media])
    else
      render status: 404, text: "tag not found"
    end
  end

end
