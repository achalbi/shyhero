class InterestsController < ApplicationController

def create
	@interest = Interest.create(interest_params)
	@user = User.find(params[:user_id])
	@rel =  MyInterest.create(from_node: @user, to_node: @interest)
	@interests = @user.userInterests
end

def destroy
	interest = Interest.find(params[:id])
	rel = current_user.rels(type: :userInterests, between: interest)
	rel[0].destroy
	interest.destroy
	@interests = current_user.userInterests
end

private

def interest_params
   params.require(:interest).permit(:interestType, :interestSubType, :about)
end

end
