class PostsController < ApplicationController

    def index
        @friends = Friend.where(current_user_id: current_user.id).order(created_at: :desc)
        @posts = Post.all
        users = User.all
        @users=[]
        users.each do |user|
            if user.posts.any?
                @users << user
            end
        end
    end

    def create
        @user = User.find(current_user.id)
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

    def filtering
        if (params[:date_1] && params[:date_2]) || params[:user_name] || params[:x] || params[:y]
           if @posts = Post.where('created_at BETWEEN ? AND ? ', params[:date_1],params[:date_2])
            flash[:success] = "the data is requested!!"
            redirect_to posts_path
            else 
             flash[:danger]="Failed!!!!"
             redirect_to posts_path
            end
        end
    end

    private 
     def post_params 
        params.require(:post).permit(:content)
     end
end
