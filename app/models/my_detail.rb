class MyDetail
  include Neo4j::ActiveNode

  property :like_count, :type => Integer, :index => :exact, default: 0
  property :badge_count, :type => Integer, :index => :exact, default: 0
  property :location_count, :type => Integer, :index => :exact, default: 0
  property :testimonial_count, :type => Integer, :index => :exact, default: 0
  property :interest_count, :type => Integer, :index => :exact, default: 0
  property :crush_count, :type => Integer, :index => :exact, default: 0
  property :picture_count, :type => Integer, :index => :exact, default: 0

  has_one :in, :getDetails,  model_class: User,  rel_class: GetDetail

end
