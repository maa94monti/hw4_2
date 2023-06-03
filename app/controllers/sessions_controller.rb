class SessionsController < ApplicationController

  def new
  # render login form in sessions/new.html.erb
  end
  def create
    # authenticate the user
    # 1. try to find the user by their unique identifier
    @user = User.find_by({"email" => params["email"] })
    # 2. if the user exists -> check if they know their password
    if @user != nil
    # 3. if they know their password -> login is successful
    if BCrypt::Password.new(@user["password"]) == params["password"]
      # assign a cookie
      session["user_id"] = @user["id"]
    # 4. if the email does not exist or they do not know their password -> login fails
      # session["user_id"] = @user["id"]
      flash["notice"] = "Welcome!"  
      redirect_to "/places"
    else
      # logout the user
      flash["notice"] = "Credentials are not correct. Please try again!"
      redirect_to "/login"
    end 
    else 
      flash["notice"] = "Credentials are not correct. Please try again!"
      redirect_to "/login"
    end
  end

    def destroy
      session["user_id"] = nil
      flash["notice"] = "Goodbye!"
      redirect_to "/login"
    end

end