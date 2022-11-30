class CommentsController < ApplicationController

    def create
       @comment = Comment.new(comment_params)
       @user = User.find(current_user.id)
       @comment.user = @user
       @post = Post.find(params[:post_id])
       @comment.post = @post
       if @comment.save
          flash[:success]="Added a comment "
          redirect_to posts_path
       end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to posts_path
    end

    private 
    def comment_params 
        params.require(:comment).permit(:content)
    end
end
