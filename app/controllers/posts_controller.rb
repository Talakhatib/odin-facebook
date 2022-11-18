class PostsController < ApplicationController

    def index
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
