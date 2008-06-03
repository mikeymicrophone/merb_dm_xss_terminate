if defined?(Merb::Plugins)
  require 'merb_xss_terminate/xss_terminate'
  require 'merb_xss_terminate/rails_sanitize'
  require 'merb_xss_terminate/html5lib_sanitize'

  Merb::BootLoader.before_app_loads do
    ActiveRecord::Base.send(:include, XssTerminate)
  end

  Merb::Plugins.add_rakefiles "merb_xss_terminate/merbtasks"
end