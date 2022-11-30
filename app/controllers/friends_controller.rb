class FriendsController < ApplicationController

    def index
        @friends = Friend.where(current_user_id: current_user.id)
    end

    def create
        c_o_friend = Friend.new(current_user_id: current_user.id ,other_user_id: params[:other_user])
        o_c_friend = Friend.new(current_user_id: params[:other_user], other_user_id: current_user.id)
        user = User.find(params[:other_user])
        if c_o_friend.save && o_c_friend.save 
            flash[:success] = "Now you'er friend with " + user.name.titleize + " !! "
            redirect_to friends_path
        end
    end
end
