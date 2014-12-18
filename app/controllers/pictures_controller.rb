class PicturesController < ApplicationController

def create
	@picture = Picture.create(picture_params)
	@user = current_user
	@my_pictures = MyPicture.create(from_node: @user, to_node: @picture)
	@pictures = @user.pictures.nil? ? []: @user.pictures
end

def destroy
	@picture = Picture.find(params[:id])
	@picture.rels(dir: :incoming, type: "pictures")[0].destroy
	@picture.destroy
	head :ok
end

def update
	@interest = Interest.find(params[:id])
	@interest.update!(interest_params)
	@interests = current_user.userInterests
	@interests_count = @interests.count
end

def new_upload_form
end

def pics_edit
	@user = current_user
    @pictures = current_user.pictures
end

def set_default_pic
    current_user.default_pic = params[:default_pic]
    current_user.save!
end

  def set_visible_pic
  	@picture = Picture.find_by(pic: params[:visible_pic])
    @picture.visible = params[:status] 
    @picture.save!
    head :ok
  end

private

def picture_params
   params.require(:picture).permit(:pic, :visible)
end

end
