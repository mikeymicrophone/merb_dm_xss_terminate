# Rails HTML sanitization on some fields
class Entry
  include DataMapper::Resource
  property :title, String
  property :body, Text
  property :extended, Text
  property :person_id, Integer
  property :created_on, DateTime
  
  belongs_to :person
  has n, :comments
  
  xss_terminate :sanitize => [:body, :extended]
end
