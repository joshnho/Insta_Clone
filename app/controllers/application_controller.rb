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
end
