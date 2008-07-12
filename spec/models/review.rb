class Review
  include DataMapper::Resource
  # include XssTerminate
  property :id, Integer, :serial => true
  property :title, String
  property :body, Text
  property :extended, Text
  property :person_id, Integer
  property :created_on, DateTime
  
  belongs_to :person
  options = {}
  # @xss_terminate_options = {:disable => (options[:disable] || false),
  #     :except => (options[:except] || []),
  #     :html5lib_sanitize => (options[:html5lib_sanitize] || []),
  #     :sanitize => (options[:sanitize] || [])}
  
  
  xss_terminate :html5lib_sanitize => [:body, :extended]
end
