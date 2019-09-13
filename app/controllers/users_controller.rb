class UsersController < ApplicationController

    def index
        @users = User.all
        @posts = Post.all.sort_by {|post| post.id}.reverse
        # @posts.sort_by {|post| post.created_at}
    end

    def show
        @user = User.find(params[:id])
        @sorted_posts = @user.posts.sort.reverse
        @posts = Post.all.sort_by {|post| post.id}.reverse
        @post = @user.posts.build
    end

    def new
        @user = User.new(
            name: params[:name],
            email: params[:email],
            username: params[:username],
            age: params[:age],
            password: params[:password]
    )
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Successfully Created User!"
            redirect_to user_path(params[:id])
        end
    end
    # def new
    #     @user = User.new
    # end

    # def create
    #     @user = User.create(user_params)
    #     redirect_to user_path(@user)
    # end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:errors] = @user.errors.full_messages
          redirect_to '/signup'
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
