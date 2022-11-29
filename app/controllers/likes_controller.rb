class LikesController < ApplicationController

    def create
        like = Like.new 
        @user = User.find(current_user.id)
        @post = Post.find(params[:post_id])
        like.user = @user 
        like.post = @post 
        if like.save! 
            redirect_to posts_path
        end
    end

    def destroy
        like = Like.find(params[:id])
        like.destroy 
        redirect_to posts_path
    end
end
