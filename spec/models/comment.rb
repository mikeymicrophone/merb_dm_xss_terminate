# Comment uses the default: stripping tags from all fields.
class Comment
  include DataMapper::Resource
  # include XssTerminate
  property :id, Integer, :serial => true
  property :person_id, Integer
  property :title, String
  property :body, Text
  property :created_on, DateTime
  
  belongs_to :entry
  belongs_to :person
  # options = {}
  # @xss_terminate_options = {:disable => (options[:disable] || false),
  #     :except => (options[:except] || []),
  #     :html5lib_sanitize => (options[:html5lib_sanitize] || []),
  #     :sanitize => (options[:sanitize] || [])}
  
  
end
