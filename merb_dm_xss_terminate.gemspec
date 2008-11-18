Gem::Specification.new do |s|
  s.name = %q{merb_dm_xss_terminate}
  s.version = "0.6.1"

  s.specification_version = 2 if s.respond_to? :specification_version=

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Schwab"]
  s.date = %q{2008-07-11}
  s.description = %q{Plugin that auto-sanitizes data before it is saved in your DataMapper models}
  s.email = %q{mike.schwab@gmail.com}
  s.extra_rdoc_files = ["README", "LICENSE", "TODO"]
  s.files = ["LICENSE", "README", "Rakefile", "TODO", "merb_rake_helper.rb", "lib/merb_dm_xss_terminate", "lib/merb_dm_xss_terminate/html", "lib/merb_dm_xss_terminate/html/document.rb", "lib/merb_dm_xss_terminate/html/node.rb", "lib/merb_dm_xss_terminate/html/sanitizer.rb", "lib/merb_dm_xss_terminate/html/selector.rb", "lib/merb_dm_xss_terminate/html/tokenizer.rb", "lib/merb_dm_xss_terminate/html/version.rb", "lib/merb_dm_xss_terminate/html5lib_sanitize.rb", "lib/merb_dm_xss_terminate/merbtasks.rb", "lib/merb_dm_xss_terminate/rails_sanitize.rb", "lib/merb_dm_xss_terminate/xss_terminate.rb", "lib/merb_dm_xss_terminate.rb", "spec/config", "spec/config/database.yml", "spec/merb_dm_xss_terminate_spec.rb", "spec/models", "spec/models/comment.rb", "spec/models/entry.rb", "spec/models/message.rb", "spec/models/person.rb", "spec/models/review.rb", "spec/schema.rb", "spec/spec_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/schwabsauce/merb_dm_xss_terminate}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.1.1}
  s.summary = %q{Plugin that auto-sanitizes data before it is saved in your DataMapper models}

  s.add_dependency(%q<merb-core>, [">= 0.9.0"])
  s.add_dependency(%q<html5>, [">= 0.10.0"])
end
