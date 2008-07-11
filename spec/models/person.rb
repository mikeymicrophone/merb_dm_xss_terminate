# This model excepts HTML sanitization on the name
class Person
  include DataMapper::Resource
  include XssTerminate#::ClassMethods::ModelMethods
  property :id, Integer, :serial => true
  property :name, String
  has n, :entries
  puts included_modules
  xss_terminate :except => [:name]
end
