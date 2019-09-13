class LikesController < ApplicationController
    def new
        @like = Like.new
        @users = User.all
        @posts = Post.all
    end

    def create
        # @like = Like.create(like_params)
        @like_counter = 0
        if @can_like
            use_one_like
            @like = Like.create(post_id: params[:post_id])
            @like_counter = @like_counter + 1
            flash["notification"] = "You just voted for #{ @like.post.content} ️"
        else
            flash["errors"] = [ "You already liked this picture" ]
        end
        redirect_to post_path
    end

    private

    def like_params
        params.require(:like).permit(:user_id, :post_id)
    end
end
