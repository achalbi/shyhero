class Location 
  include Neo4j::ActiveNode

  property :address, :type => String, :index => :exact
  property :name, :type => String, :index => :exact
  property :place_id, :type => String, :index => :exact
  property :id_loc, :type => String, :index => :exact
  property :latitude, :type => Float, :index => :exact
  property :longitude, :type => Float, :index => :exact 
 

  has_one :both, :places,  model_class: User,  rel_class: Place
  #has_many :in, :users, origin: :users_place
end
