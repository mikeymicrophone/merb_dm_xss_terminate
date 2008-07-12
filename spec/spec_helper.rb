$TESTING=true
$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
gem 'merb-core', '= 0.9.3'
require 'merb-core/test'
require 'dm-core'
require 'merb_dm_xss_terminate'

Merb.start :adapter => 'runner', :environment => 'test', :merb_root => File.dirname(__FILE__)

# load test models
require File.join(File.dirname(__FILE__), 'models/person')
require File.join(File.dirname(__FILE__), 'models/entry')
require File.join(File.dirname(__FILE__), 'models/comment')
require File.join(File.dirname(__FILE__), 'models/message')
require File.join(File.dirname(__FILE__), 'models/review')

# load test schema
load(File.dirname(__FILE__) + "/schema.rb")

# def xss_terminate_options options = {}
#   {
#     :disable => (options[:disable] || false),
#     :except => (options[:except] || []),
#     :html5lib_sanitize => (options[:html5lib_sanitize] || []),
#     :sanitize => (options[:sanitize] || [])
#   }
# end