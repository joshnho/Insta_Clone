class ApplicationController < ActionController::Base
    # def set_up_voting
    #     # session["remaining_votes"] ||= 5
    #     @notification = flash["notification"]
    #     @errors = flash["errors"]
    #     # byebug
    #     if (session[:user_id])
    #       @logged_in_user = User.find(session[:user_id])
    #       @remaining_votes = @logged_in_user.remaining_votes
    #       @can_vote = @logged_in_user.can_vote?
    #     end
    # end

    before_action :set_up_likes

    def authenticate_user
        byebug
        @logged_in_user = nil
        if User.find(params[:id])
            @check = User.find(params[:id])
            
        else
            @check = nil
        end
        @logged_in_user = @check
    end

    private

    def set_up_likes
        #if user voted, limit vote to one, 
        session["remaining_likes"] ||= 1
        @remaining_likes = session["remaining_likes"]
        @can_like = @remaining_likes > 0
        @notification = flash["notification"]
        @errors = flash["errors"]
        
    end
    
#set up a counter for number of likes in Post_controller show action
#in show page, the counter instance is @like_counter

#Problem: When I press on the 'LIKE EMOJI' button, it raises an error from the Like Model
   
    def use_one_like 
        #reduce like by 1
        session["remaining_likes"] -= 1
    end
end
