# This model excepts HTML sanitization on the name
class Person
  include DataMapper::Resource
  # include XssTerminate#::ClassMethods::ModelMethods
  property :id, Integer, :serial => true
  property :name, String
  has n, :entries

  # options = {}
  # @xss_terminate_options = {:disable => (options[:disable] || false),
  #     :except => (options[:except] || []),
  #     :html5lib_sanitize => (options[:html5lib_sanitize] || []),
  #     :sanitize => (options[:sanitize] || [])}
  
  
  xss_terminate :except => [:name]
end
