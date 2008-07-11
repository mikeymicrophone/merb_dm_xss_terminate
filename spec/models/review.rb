class Review
  include DataMapper::Resource
  property :title, String
  property :body, Text
  property :extended, Text
  property :person_id, Integer
  property :created_on, DateTime
  
  belongs_to :person
  
  xss_terminate :html5lib_sanitize => [:body, :extended]
end
