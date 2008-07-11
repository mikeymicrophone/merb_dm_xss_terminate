class Message
  include DataMapper::Resource
  property :person_id, Integer
  property :recipient_id, Integer
  property :body, Text
  
  belongs_to :person
end
