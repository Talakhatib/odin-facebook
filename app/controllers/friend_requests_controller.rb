class FriendRequestsController < ApplicationController

    def index
        @users = User.where.not(id: current_user.id)
    end

    def create
        @friend = FriendRequest.new(from_user_id: current_user.id , to_user_id: params[:to_user] )

        if @friend.save
            flash[:success] = "Friend Request in sent !"
            redirect_to friend_requests_path
        end
    end

    def destroy
        @friend = FriendRequest.find(params[:id])
        @friend.destroy 
        redirect_to friend_requests_path
    end
end
