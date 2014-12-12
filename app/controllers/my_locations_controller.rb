class MyLocationsController < ApplicationController

def create
=begin
	if params[:place_id].nil?
      return
    end
    @location = Location.find_by(place_id: params[:place_id])
    if @location.nil?
	   @location = Location.create(location_params)
    end
	@rel =  Place.create(from_node: @user, to_node: @location, place_type: params[:place_type], details: params[:details], current_place: params[:current_place])
	@locations = @user.places
=end

end

def destroy
    @location = Location.find(params[:id])
    if @location.rels(type: :places).count > 1
      current_user.rels(type: :places, between: @location)[0].destroy
    else
      @location.destroy
    end
end

def update
	@location = Location.find(params[:id])
	@location.update!(location_params)
	rel = current_user.rels(type: :places, between: @location)[0]
	rel.place_type = params[:place_type]
	rel.current_place = params[:current_place]
	rel.details = params[:details]
	rel.save!
end

private

def location_params
   params.require(:location).permit(:address, :name, :place_id, :id_loc, :latitude, :longitude)
end

end
