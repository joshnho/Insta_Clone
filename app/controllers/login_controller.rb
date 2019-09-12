class LoginController < ApplicationController

    def index
        
    end

    # def new
    #     @user = User.find_by(params[:username])
    # end

    # def create
    #     byebug
    #     @user = User.find_by(username: params[:username])
    #     if @user && @user.authenticate(params[:password])
    #         session[:user_id] = @user.id
    #         redirect_to user_path(@user)
    #     else
    #         flash[:errors] = ["Username or Password not found."]
    #         redirect_to homepage_path
    #     end
    # end
    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            # byebug
            session[:user_id] = @user.id
            flash[:success] = 'Successfully Logged in!'
            redirect_to user_path(@user)
        else
            flash[:warning] = "Invalid Username or Password"
            redirect_to "/signin"
        end
    end

    # def new
    #     @user = User.new(
    #         name: params[:name],
    #         email: params[:email],
    #         username: params[:username],
    #         age: params[:age],
    #         password: params[:password]
    # )
    #     if @user.save
    #         session[:user_id] = @user.id
    #         flash[:success] = "Successfully Created User!"
    #         redirect_to user_path(params[:id])
    #     end
    # end
end