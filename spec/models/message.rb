class Message
  include DataMapper::Resource
  include XssTerminate
  property :id, Integer, :serial => true
  property :person_id, Integer
  property :recipient_id, Integer
  property :body, Text
  
  belongs_to :person
end
