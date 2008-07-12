class Message
  include DataMapper::Resource
  # include XssTerminate
  property :id, Integer, :serial => true
  property :person_id, Integer
  property :recipient_id, Integer
  property :body, Text
  
  belongs_to :person
  # options = {}
  # @xss_terminate_options = {:disable => (options[:disable] || false),
  #     :except => (options[:except] || []),
  #     :html5lib_sanitize => (options[:html5lib_sanitize] || []),
  #     :sanitize => (options[:sanitize] || [])}
  
  
end
