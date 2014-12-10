class StaticPagesController < ApplicationController

  def home
  	@user = current_user
  	unless @user.nil?
  		@pictures = @user.pictures.nil? ? []: @user.pictures
  		@testimonials = @user.testimonials
      @latitude = nil #'12.9715987'
      @longitude = nil #'77.5945627'
      @interests = @user.userInterests
  	end
  end

  def help
  end
end
