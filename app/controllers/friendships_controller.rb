class FriendshipsController < InheritedResources::Base
   
    def create
      @friendship = current_user.friendships.build(:friend_id => params[:friend_id], approved: "false")
      if @friendship.save
        flash[:notice] = "Friend requested."
        redirect_to :back
      else
        flash[:error] = "Unable to request friendship."
        redirect_to :back
      end
    end

    def update
    @friendship = Friendship.where(friend_id: current_user, user_id: params[:id]).first
    @friendship.update(approved: true)
      if @friendship.save
        redirect_to root_url, :notice => "Successfully confirmed friend!"
      else
        redirect_to root_url, :notice => "Sorry! Could not confirm friend!"
      end
    end

    def destroy
      @friendship = Friendship.where(friend_id: [current_user, params[:id]]).where(user_id: [current_user, params[:id]]).last
      @friendship.destroy
      flash[:notice] = "Removed friendship."
      redirect_to :back
    end

  private

    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :approved)
    end
end

