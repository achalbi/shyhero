class Badge 
	include Neo4j::ActiveRel
	property :badgeType, :type => String
	property :pic, :type => String
	property :created_at  # will automatically be set when model changes
	property :updated_at  # will automatically be set when model changes

  from_class User
  to_class   User
  type 'badges'

end
