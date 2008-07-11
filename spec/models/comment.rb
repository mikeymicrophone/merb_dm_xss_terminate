# Comment uses the default: stripping tags from all fields.
class Comment
  include DataMapper::Resource
  property :person_id, Integer
  property :title, String
  property :body, Text
  property :created_on, DateTime
  
  belongs_to :entry
  belongs_to :person
end
