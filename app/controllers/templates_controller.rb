class TemplatesController < ApplicationController
  layout false
  
  def root
    template = params[:template]
    if respond_to? template.to_sym
      render "templates/" + template
    else
      render status: 404, plain: "Template could not be found"
    end
  end

  def banner 

  end
  
  def menu

  end

  def library

  end

  def media

  end
  
  def addMedia

  end

  def missingMedia

  end

  def mediumCell

  end

end
