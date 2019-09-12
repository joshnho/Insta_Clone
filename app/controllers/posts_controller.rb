class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @user = User.find(params[:id])
        @post = @user.posts.build
    end

    def new
        @post = Post.new
        @users = User.all
    end
    
    def create
        @user = User.find(params[:user_id])
        @post = Post.new(post_params)
        @post.user_id = @user.id
        @post.save
        redirect_to user_path(@user)
    end

    # def edit
    #     find_post
    #     # byebug
    # end

    # def update
    #    find_post
    #    @post.update(post_params)
    #    redirect_to post_path(@post) 
    # end

    private

    def post_params
        params.require(:post).permit(:description, :content, :user_id)
    end

    def find_post
        @post = Post.find(params[:id])
    end
end
