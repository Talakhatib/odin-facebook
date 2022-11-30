class PostsController < ApplicationController

    def index
        @friends = Friend.where(current_user_id: current_user.id).order(created_at: :desc)
        @posts = Post.all
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

    def search
      users = User.all
        @users=[]
        users.each do |user|
            if user.posts.any?
                @users << user
            end
        end
    end

    def filtering
      date_1 = params[:date_1]
      date_2 = params[:date_2]
      user_name = params[:user_name]
      x = params[:x]
      y = params[:y]
        if !date_1.blank? && !date_2.blank? && !user_name.blank? 
           @posts =[]
           posts = Post.where('created_at BETWEEN ? AND ? AND user_id= ? ', date_1,date_2,user_name)
            if !x.blank? && !y.blank?
              posts.each do |post|
                number = post.likes.count
                if x.to_i < number && number < y.to_i
                   @posts << post
                end
              end
            else
                if !y.blank?
                    posts.each do |post|
                    number = post.likes.count
                    if y.to_i > number
                       @posts << post
                    end
                  end
                else
                  if !x.blank? 
                    posts.each do |post|
                      number = post.likes.count
                      if x.to_i < number 
                         @posts << post
                      end
                    end
                  else
                   @posts = posts
                  end
                end
            end
          respond_to do |format|
            format.turbo_stream
            format.html {  redirect_to posts_path}
          end
        else
          flash[:danger]="Failed!!!"
          redirect_to posts_path
        end
    end


    private 
     def post_params 
        params.require(:post).permit(:content)
     end
end
