class Place 
	include Neo4j::ActiveRel
	property :placetype, :type => String
	property :created_at  # will automatically be set when model changes
	property :updated_at  # will automatically be set when model changes

  from_class User
  to_class   Location
  type 'places'

end
