class Picture 
  include Neo4j::ActiveNode

  property :visible, :type => Boolean, :index => :exact
  property :pic, :type => String, :index => :exact
  property :fb_id, :type => String, :index => :exact

  has_one :in, :pictures,  model_class: User,  rel_class: MyPicture

end
