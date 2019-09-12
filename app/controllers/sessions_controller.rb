class SessionsController < ApplicationController
    def index
        if current_user
            @user = current_user.user
            render user_path(current_user)
        else 
            flash[:warning] = "You must be logged in to see this page"
            redirect_to 'login'
        end
    end

    # def new
    #     @user = User.new
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
            redirect_to "/login"
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = 'Successfully Logged Out!'
        redirect_to homepage_path
    end
end
