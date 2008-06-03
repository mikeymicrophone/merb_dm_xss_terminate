$TESTING=true
$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'merb-core'
require 'merb-core/test'
require 'merb_activerecord'
require 'merb_xss_terminate'

Merb.start :adapter => 'runner', :environment => 'test', :merb_root => File.dirname(__FILE__)

# load test schema
load(File.dirname(__FILE__) + "/schema.rb")

# load test models
require File.join(File.dirname(__FILE__), 'models/person')
require File.join(File.dirname(__FILE__), 'models/entry')
require File.join(File.dirname(__FILE__), 'models/comment')
require File.join(File.dirname(__FILE__), 'models/message')
require File.join(File.dirname(__FILE__), 'models/review')
