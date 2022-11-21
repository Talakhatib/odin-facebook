class PostsController < ApplicationController

    def index
        @friends = Friend.where(current_user_id: current_user.id).order(created_at: :desc)
        @posts = Post.all
    end

    def create
        @user = User.find(params[:user_id])
        @post = @user.posts.build(post_params)
        @post.image.attach(params[:post][:image])
        if @post.save!
            flash[:success]="Post successfuly added !!"
            redirect_to current_user
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    private 
     def post_params 
        params.require(:post).permit(:content)
     end
end
