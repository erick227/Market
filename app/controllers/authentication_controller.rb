class AuthenticationController < ApplicationController

  def authenticate
    email = params[:session][:email]
    password = params[:session][:password]
    
    puts session

    user = User.find_by(email: email)
    puts user
    if user and user.authenticate password
      session[:id] = user.id
      redirect_to "/"
    else
      if user.nil?
        puts "User not found"
      else
        puts "Password not authentic"
      end

      redirect_to action: 'login', failure: true
    end
  end


  def login
    @failed_attempt = false
    @failed_attempt |= params[:failure]
  end

  def signup
    
  end

  def signupHook
    name = params[:session][:name]
    phone = params[:session][:phone]
    zipcode = params[:session][:zipcode]
    email = params[:session][:email]
    password = params[:session][:password]

    new_user = User.new name: name, phone: phone, zipcode: zipcode, email: email, password: password, password_confirmation: password

    if new_user.save
      redirect_to "/" if new_user
    else
      render status: 403, text: "would result in duplicate user"
    end
  end
  
end
