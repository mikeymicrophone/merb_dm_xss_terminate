# This model excepts HTML sanitization on the name
class Person
  include DataMapper::Resource
  property :name, String
  has_many :entries
  xss_terminate :except => [:name]
end
