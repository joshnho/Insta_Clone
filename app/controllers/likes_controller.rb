class LikesController < ApplicationController
    def new
        @like = Like.new
        @users = User.all
        @posts = Post.all
    end

    def create
        @like = Like.create(like_params)
    end

    private

    def like_params
        params.require(:like).permit(:user_id, :post_id)
    end
end
