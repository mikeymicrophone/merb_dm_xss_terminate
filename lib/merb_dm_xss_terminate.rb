if defined?(Merb::Plugins)
  require 'merb_dm_xss_terminate/xss_terminate'
  require 'merb_dm_xss_terminate/rails_sanitize'
  require 'merb_dm_xss_terminate/html5lib_sanitize'

  Merb::BootLoader.before_app_loads do
    DataMapper::Resource.send(:include, XssTerminate)
  end

  Merb::Plugins.add_rakefiles "merb_dm_xss_terminate/merbtasks"
end